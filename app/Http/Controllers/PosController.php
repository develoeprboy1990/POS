<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Yajra\DataTables\DataTables;
use Illuminate\Validation\Rule;
use NumberToWords\NumberToWords;
use App\Models\Warehouse;
use App\Models\Brand;
use App\Models\Unit;
use App\Models\PosSetting;
use App\Models\Tax;
use App\Models\Payment;
use App\Models\Currency;
use DNS1D;
use DNS2D;
use Keygen;
use Image;
use PDF;

class PosController extends Controller
{

    public function showInvoice($InvoiceMasterID)
    {
        $invoice_master = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();
        $invoice_detail = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->get();
        $party = DB::table('party')->where('PartyID', $invoice_master->PartyID)->first();
        return view('invoice.show_invoice', compact('invoice_detail', 'invoice_master', 'party'));
    }


    public function printInvoice($InvoiceMasterID)
    {
        $lims_sale_data = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();
        $lims_product_sale_data = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->get();
        $lims_biller_data = DB::table('user')->where('UserId',$lims_sale_data->UserID)->first();
        $lims_warehouse_data = Warehouse::find($lims_sale_data->WarehouseID);
        $lims_customer_data = DB::table('party')->where('PartyID', $lims_sale_data->PartyID)->first();
        $lims_payment_data = Payment::where('InvoiceMasterID', $InvoiceMasterID)->get();

        $company = DB::table('company')->first();

        $numberToWords = new NumberToWords();
        if(\App::getLocale() == 'ar' || \App::getLocale() == 'hi' || \App::getLocale() == 'vi' || \App::getLocale() == 'en-gb')
            $numberTransformer = $numberToWords->getNumberTransformer('en');
        else
            $numberTransformer = $numberToWords->getNumberTransformer(\App::getLocale());
        $numberInWords = $numberTransformer->toWords($lims_sale_data->GrandTotal);
        return view('invoice.print_invoice', compact('lims_sale_data', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords','company'));
    }

    public function printVoucher($InvoiceMasterID)
    {
        $lims_sale_data = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();
        $lims_product_sale_data = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->whereNull('dish_type_id')->get();
        $lims_product_dish_data = DB::table('invoice_dish_details')->where('invoice_master_id', $InvoiceMasterID)->get();
        $lims_biller_data = DB::table('user')->where('UserId',$lims_sale_data->UserID)->first();

        $lims_warehouse_data = Warehouse::find($lims_sale_data->WarehouseID);
        $lims_customer_data = DB::table('party')->where('PartyID', $lims_sale_data->PartyID)->first();
        $lims_payment_data = Payment::where('InvoiceMasterID', $InvoiceMasterID)->orderBy('paymentID','DESC')->first();
        // dd($lims_payment_data);

        $company = DB::table('company')->first();

        $numberToWords = new NumberToWords();
        if(\App::getLocale() == 'ar' || \App::getLocale() == 'hi' || \App::getLocale() == 'vi' || \App::getLocale() == 'en-gb')
            $numberTransformer = $numberToWords->getNumberTransformer('en');
        else
            $numberTransformer = $numberToWords->getNumberTransformer(\App::getLocale());
        $numberInWords = $numberTransformer->toWords($lims_sale_data->GrandTotal);
        return view('invoice.print_voucher', compact('lims_sale_data', 'lims_product_sale_data','lims_product_dish_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords','company'));
    }

    public function invoiceListing(Request $request)
    {
        if ($request->ajax()) {
            $invoices = DB::table('invoice_master')->where('InvoiceNo','like','POS%')->get();
            return Datatables::of($invoices)
                ->addIndexColumn()
                ->addColumn('payment_status', function ($row) {
                    if ($row->Balance == 0)
                        $pay_status = '<span class="badge alert-success">Paid</span>';
                    else
                        $pay_status = '<span class="badge alert-danger">Due</span>';

                    return $pay_status;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<div class="dropdown"><a href="#" class="dropdown-toggle card-drop" data-bs-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal font-size-18"></i></a><div class="dropdown-menu dropdown-menu-end">';
                    $btn .= '<a href="' . route('sales.edit',   $row->InvoiceMasterID) . '" class="dropdown-item" target="_blank">Edit Invoice</a><a href="' . route('invoice.show', ['id' => $row->InvoiceMasterID]) . '" class="dropdown-item" target="_blank">View Invoice</a><a href="' . route('voucher.print', ['id' => $row->InvoiceMasterID]) . '" class="dropdown-item" target="_blank">Print Invoice</a><button type="button" class="add-payment dropdown-item" data-id = "'.$row->InvoiceMasterID.'" data-bs-toggle="modal" data-bs-target="#add-payment">'.trans('file.Add Payment').'</button>';
                    $btn .= ' </div></div>';
                    return $btn;
                })
                ->rawColumns(['payment_status', 'action'])
                ->make(true);
        }
        return view('invoice.pos_listing');
    }


    public function wareHouseList(Request $request)
    {
        if ($request->ajax()) {
            $wareHouses = Warehouse::where('is_active', 1)->get();
            return Datatables::of($wareHouses)
                ->addIndexColumn()
                ->addColumn('no_of_prod', function ($row) {
                    $no_of_prod = DB::table('v_inventory')->where('WarehouseID',$row->id)->count('ItemID');
                    return $no_of_prod;
                })
                ->addColumn('stock_qty', function ($row) {
                    $stock_qty = DB::table('v_inventory')->where('WarehouseID',$row->id)->sum('Balance');
                    return $stock_qty;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_warehouse" data-id="' . $row->id . '" data-name="' . $row->name . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`wareHouseDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['no_of_prod', 'stock_qty', 'action'])
                ->make(true);
        }

        return view('warehouse_list');
    }

    public function storeWareHouse(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => [
                    'max:255',
                    Rule::unique('warehouses')->where(function ($query) {
                        return $query->where('is_active', 1);
                    }),
                ],
            ],
            [
                'name.required' => 'WareHouse Name is required',
            ]
        );

        $input = $request->all();
        $input['is_active'] = true;
        Warehouse::create($input);
        return redirect('ware-house-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getWarehouseDetail(Request $request)
    {
        $warehouse = Warehouse::findOrFail($request->warehouse_id);
        return response()->json($warehouse);
    }

    public function updateWareHouse(Request $request)
    {
        $this->validate(
            $request,
            [
                'name' => [
                    'max:255',
                    Rule::unique('warehouses')->ignore($request->warehouse_id)->where(function ($query) {
                        return $query->where('is_active', 1);
                    }),
                ],
            ],
            [
                'name.required' => 'WareHouse Name is required',
            ]
        );

        $input = $request->all();
        $lims_warehouse_data = Warehouse::find($input['warehouse_id']);
        $lims_warehouse_data->update($input);

        return redirect('ware-house-list')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function deleteWareHouse($id)
    {
        $lims_warehouse_data = Warehouse::find($id);
        $lims_warehouse_data->is_active = false;
        $lims_warehouse_data->save();
        return redirect('ware-house-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function brandList(Request $request)
    {
        if ($request->ajax()) {
            $lims_brand_all = Brand::where('is_active', true)->get();
            return Datatables::of($lims_brand_all)
                ->addIndexColumn()
                ->addColumn('brand_img', function ($row) {
                    if ($row->image)
                        $brand_img = '<td><img src="'.url('thumbnail', $row->image).'"></td>';
                    else
                        $brand_img = '<td><img src="'.url('assets/images/product/zummXD2dvAtI.png').'" height="100" width="100"></td>';

                    return $brand_img;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_brand" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`brandDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['brand_img', 'action'])
                ->make(true);
        }

        return view('brand_list');
    }

    public function storeBrand(Request $request)
    {
        $request->title = preg_replace('/\s+/', ' ', $request->title);

        $this->validate(
            $request,
            [
                'title' => [
                    'max:255',
                    Rule::unique('brands')->where(function ($query) {
                        return $query->where('is_active', 1);
                    }),
                ],

                // 'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
            ],
            [
                'title.required' => 'Brand title is required',
                // 'image.required' => 'Image is required',
            ]
        );

        $input = $request->except('image');
        $input['is_active'] = true;
        $image = $request->file('image');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
            $destinationPath = public_path('assets/images/brand');
            $image->move($destinationPath, $imageName);
            $input['image'] = $imageName;
        }
        Brand::create($input);
        return redirect('brand-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getBrandDetail(Request $request)
    {
        $brand = Brand::findOrFail($request->brand_id);
        return response()->json($brand);
    }

    public function updateBrand(Request $request)
    {
        $this->validate($request, [
            'title' => [
                'max:255',
                Rule::unique('brands')->ignore($request->brand_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

            // 'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        ]);
        $lims_brand_data = Brand::findOrFail($request->brand_id);
        $lims_brand_data->title = $request->title;
        $image = $request->file('image');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
            $destinationPath = public_path('assets/images/brand');
            $image->move($destinationPath, $imageName);

            $lims_brand_data->image = $imageName;
        }
        $lims_brand_data->save();
        return redirect('brand-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function deleteBrand($id)
    {
        $lims_brand_data = Brand::findOrFail($id);
        $lims_brand_data->is_active = false;
        $lims_brand_data->save();
        return redirect('brand-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function unitList(Request $request)
    {
        $lims_unit_all = Unit::get();
        if ($request->ajax()) {
            return Datatables::of($lims_unit_all)
                ->addIndexColumn()
                ->addColumn('status', function ($row) {
                    if($row->status == 1)
                    $status = 'Active';
                    else
                    $status = 'In Active';

                    return $status;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_unit" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`unitDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['status','action'])
                ->make(true);
        }

        return view('unit_list',compact('lims_unit_all'));
    }
    
    public function storeUnit(Request $request)
    {
        $this->validate($request, [
            'base_unit' => [
                'max:255',
                    Rule::unique('units')->where(function ($query) {
                    return $query->where('status', 1);
                }),
            ]

        ]);
        $input = $request->all();
        Unit::create($input);
        return redirect('unit-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getUnitDetail(Request $request)
    {
        $lims_unit_data = Unit::findOrFail($request->unit_id);
        return response()->json($lims_unit_data);
    }
    
    public function updateUnit(Request $request)
    {
        $this->validate($request, [
            'base_unit' => [
                'max:255',
                    Rule::unique('units')->ignore($request->unit_id)->where(function ($query) {
                    return $query->where('status', 1);
                }),
            ]

        ]);

        $input = $request->all();
        $lims_unit_data = Unit::where('id',$input['unit_id'])->first();
        $lims_unit_data->update($input);
        return redirect('unit-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function deleteUnit($id)
    {
        $lims_unit_data = Unit::findOrFail($id);
        $lims_unit_data->delete();
        return redirect('unit-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function itemCategoryList(Request $request)
    {
        $item_categories = DB::table('item_category')->get();
        if ($request->ajax()) {
            return Datatables::of($item_categories)
                ->addIndexColumn()
                ->addColumn('image', function ($row) {
                    if($row->image)
                        $image = '<img src="'.url('thumbnail', $row->image).'">';
                    else
                        $image = '<img src="'.url('assets/images/product/zummXD2dvAtI.png').'" height="100" width="100">';

                    return $image;
                })
                ->addColumn('parent_cat', function ($row) {
                    if($row->ParentID)
                        $parent = DB::table('item_category')->where('ItemCategoryID',$row->ParentID)->pluck('title')->first();
                    else
                        $parent = "N/A";

                    return $parent;
                })
                ->addColumn('number_of_product', function ($row) {
                    $number_of_product = DB::table('item')->where('ItemCategoryID',$row->ItemCategoryID)->where('IsActive', true)->count();
                    return @$number_of_product;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_category" data-id="' . $row->ItemCategoryID . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`itemCategoryDelete`,' . $row->ItemCategoryID . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['image','parent_cat','number_of_product','stock_qty','stock_worth','action'])
                ->make(true);
        }

        return view('item_category_list',compact('item_categories'));
    }

    public function getItemCategoryDetail(Request $request)
    {
        $lims_category_data = DB::table('item_category')->where('ItemCategoryID',$request->cat_id)->first();
        $parent_id = DB::table('item_category')->where('ItemCategoryID', $lims_category_data->ParentID)->pluck('ItemCategoryID')->first();

        return response()->json([
            'lims_category_data' => $lims_category_data,
            'parent_id' => $parent_id,
        ]);
    }

    public function storeItemCategory(Request $request)
    {
        $category_name = preg_replace('/\s+/', ' ', $request->itemCategoryName);
        $this->validate($request, [
            'title' => [
                'max:255',
                    Rule::unique('item_category')->where(function ($query) {
                    return $query->where('IsActive', 1);
                }),
            ],
            // 'categoryImage' => 'image|mimes:jpg,jpeg,png,gif',
        ]);

        $image = $request->file('categoryImage');
        if ($image) {
            
            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
       
            $destinationPath = public_path('assets/images/category');
            $image->move($destinationPath, $imageName);
            
        }
        else{
            $imageName = null;
        }

        $data = array(
            "ParentID" => $request->parent_id,
            "title" => $category_name,
            "image" => $imageName,
            "type" => $request->type,
            "IsActive" => true,
        );

        $category = DB::table('item_category')->insert($data);
        return redirect('item-category-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function updateItemCategory(Request $request)
    {
        $category_name = preg_replace('/\s+/', ' ', $request->editItemCategoryName);
        $this->validate($request,[
            'title' => [
                'max:255',
                Rule::unique('item_category')->ignore($request->itemCategoryId)->where(function ($query) {
                    return $query->where('IsActive', 1);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif',
        ]);

        $input = $request->except('editCategoryImage');
        $image = $request->file('editCategoryImage');
        if ($image) {
            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
       
            $destinationPath = public_path('assets/images/category');
            $image->move($destinationPath, $imageName);

            $data = array(
                "ParentID" => $request->edit_parent_id,
                "title" => $category_name,
                "image" => $imageName,
                "type" => $request->edit_type,
            );
        }
        else{
            $data = array(
                "ParentID" => $request->edit_parent_id,
                "title" => $category_name,
                "type" => $request->edit_type,
            );
        }

        

        

        $category = DB::table('item_category')->where('ItemCategoryID', $request->itemCategoryId)->update($data);
        return redirect('item-category-list')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function deleteItemCategory($id)
    {
        $category = DB::table('item_category')->where('ItemCategoryID', $id)->delete();
        return redirect('item-category-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    
    public function currencyList(Request $request)
    {
        if ($request->ajax()) {
            $currencies = Currency::get();
            return Datatables::of($currencies)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_currency" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`currencyDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('currency_list');
    }

    public function storeCurrency(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'code' => 'required',
            'exchange_rate' => 'required',
        ]);

        $data = $request->all();
        Currency::create($data);
        return redirect('currency-list')->with('error', 'Currency Saved Successfully')->with('class', 'success');
    }

    public function getCurrencyDetail(Request $request)
    {
        $lims_currency_data = Currency::findOrFail($request->currency_id);
        return response()->json($lims_currency_data);
    }

    public function updateCurrency(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'code' => 'required',
            'exchange_rate' => 'required',
        ]);

        $data = $request->all();
        Currency::find($data['currency_id'])->update($data);
        return redirect('currency-list')->with('error', 'Currency Updated Successfully')->with('class', 'success');
    }

    public function deleteCurrency($id)
    {
        Currency::find($id)->delete();
        return redirect('currency-list')->with('error', 'Currency Deleted Successfully')->with('class', 'success');
    }

    public function taxList(Request $request)
    {
        if ($request->ajax()) {
            $lims_tax_all = Tax::where('is_active', true)->get();
            return Datatables::of($lims_tax_all)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_tax" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`taxDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('tax_list');
    }

    public function storeTax(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('taxes')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

            'rate' => 'numeric|min:0|max:100',

        ]);
        $input = $request->all();
        $input['is_active'] = true;
        Tax::create($input);
        return redirect('tax-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getTaxDetail(Request $request)
    {
        $lims_tax_data = Tax::findOrFail($request->tax_id);
        return response()->json($lims_tax_data);
    }

    public function updateTax(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                Rule::unique('taxes')->ignore($request->tax_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

            'rate' => 'numeric|min:0|max:100'
        ]);

        $input = $request->all();
        $lims_tax_data = Tax::where('id', $input['tax_id'])->first();
        $lims_tax_data->update($input);
        return redirect('tax-list')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function deleteTax($id)
    {
        $lims_tax_data = Tax::findOrFail($id);
        $lims_tax_data->is_active = false;
        $lims_tax_data->save();
        return redirect('tax-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function posSetting()
    {
        $lims_customer_list = DB::table('party')->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        
        return view('pos_setting', compact('lims_customer_list', 'lims_warehouse_list','lims_pos_setting_data'));
    }

    public function storePosSetting(Request $request)
    {
        $data = $request->all();
        //writting paypal info in .env file
        $path = '.env';
        $searchArray = array('PAYPAL_LIVE_API_USERNAME='.env('PAYPAL_LIVE_API_USERNAME'), 'PAYPAL_LIVE_API_PASSWORD='.env('PAYPAL_LIVE_API_PASSWORD'), 'PAYPAL_LIVE_API_SECRET='.env('PAYPAL_LIVE_API_SECRET') );

        $replaceArray = array('PAYPAL_LIVE_API_USERNAME='.$data['paypal_username'], 'PAYPAL_LIVE_API_PASSWORD='.$data['paypal_password'], 'PAYPAL_LIVE_API_SECRET='.$data['paypal_signature'] );

        // file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));

        $pos_setting = PosSetting::firstOrNew(['id' => 1]);
        $pos_setting->id = 1;
        $pos_setting->customer_id = $data['customer_id'];
        $pos_setting->warehouse_id = $data['warehouse_id'];
        $pos_setting->product_number = $data['product_number'];
        $pos_setting->stripe_public_key = $data['stripe_public_key'];
        $pos_setting->stripe_secret_key = $data['stripe_secret_key'];
        $pos_setting->is_dish_enabled = $data['is_dish_enabled'];
        if(!isset($data['keybord_active']))
            $pos_setting->keybord_active = false;
        else
            $pos_setting->keybord_active = true;
        $pos_setting->save();
        return redirect('pos-setting')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function storeParty(Request $request)
    {
        $lims_customer_data = $request->all();
                //creating user if given user access
        // if(isset($lims_customer_data['user'])) {
        //     $this->validate($request, [
        //         'PartyName' => [
        //             'PartyName',
        //             'max:255',
        //                 Rule::unique('party')->where(function ($query) {
        //                 return $query->where('Active', true);
        //             }),
        //         ],
        //         'PartyEmail' => [
        //             'PartyEmail',
        //             'max:255',
        //                 Rule::unique('party')->where(function ($query) {
        //                 return $query->where('Active', true);
        //             }),
        //         ],
        //     ]);

        //     $lims_customer_data['phone'] = $lims_customer_data['phone_number'];
        //     $lims_customer_data['tax_no'] = $lims_customer_data['tax_no'];
        //     $lims_customer_data['postal_code'] = $lims_customer_data['postal_code'];
        //     $lims_customer_data['role_id'] = 5;
        //     $lims_customer_data['is_deleted'] = false;
        //     $lims_customer_data['password'] = bcrypt($lims_customer_data['password']);
        //     $user = User::create($lims_customer_data);
        //     $lims_customer_data['user_id'] = $user->id;
        //     $message = 'Customer and user created successfully';
        // }
        // else {
        //     $message = 'Customer created successfully';
        // }

        $party_data = array(
            "CustomerGroupID" => $lims_customer_data['customer_group_id'],
            "PartyName" => $lims_customer_data['party_name'],
            "Email" => $lims_customer_data['party_email'],
            "Phone" => $lims_customer_data['phone_number'],
            "Mobile" => $lims_customer_data['phone_number'],
            "Address" => $lims_customer_data['address'],
            "Active" => 'Yes',
        );

        
        // if($lims_customer_data['email']) {
        //     try{
        //         Mail::send( 'mail.customer_create', $lims_customer_data, function( $message ) use ($lims_customer_data)
        //         {
        //             $message->to( $lims_customer_data['email'] )->subject( 'New Customer' );
        //         });
        //     }
        //     catch(\Exception $e){
        //         $message = 'Customer created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        //     }   
        // }

        DB::table('party')->insert($party_data);
        if($lims_customer_data['pos'])
            return redirect('create-invoice')->with('error', 'Customer Saved Successfully')->with('class', 'success');
        else
           return redirect()->back()->with('error', 'Something Went Wrong')->with('class', 'danger');

    }

    public function printBarcode()
    {
        // $lims_product_list_without_variant = $this->productWithoutVariant();
        // $lims_product_list_with_variant = $this->productWithVariant();
        $lims_product_list_without_variant = DB::table('item')->where([['IsActive', true],['ItemType', 'standard']])->select('ItemID', 'ItemName', 'ItemCode')->get();
        return view('print_barcode', compact('lims_product_list_without_variant'));
    }

    public function printBarcodes()
    {
        // $lims_product_list_without_variant = $this->productWithoutVariant();
        // $lims_product_list_with_variant = $this->productWithVariant();
        $lims_product_list_without_variant = DB::table('item')->where([['IsActive', true],['ItemType', 'Goods']])->select('ItemID', 'ItemName', 'ItemCode')->get();
        return view('print_barcodes', compact('lims_product_list_without_variant'));
    }
    public function limsStickerSearch(Request $request)
    {
        foreach ($request['code'] as $key => $product) {
            $data = array(
            "qty" => $request['qty'][$key],
            "itemid" => $product, 
        );
             $sticker = DB::table('sticker')->insert($data);
        }

        return response()->json(['url'=>url('products/lims_sticker_print')]);
        


       // return $product;
    }

    public function limsStickerPrint()
    {

        $stickerxy = DB::table('v_sticker')->get();
        $pdf = PDF::loadView('printbarcodedata',compact('stickerxy'));

        $customPaper = array(0,0,151 ,116);
        $pdf->set_paper($customPaper);

        DB::table('sticker')->truncate();
        return $pdf->stream();
    }

    // public function productWithoutVariant()
    // {
    //     return Product::ActiveStandard()->select('id', 'name', 'code')
    //             ->whereNull('is_variant')->get();
    // }

    // public function productWithVariant()
    // {
    //     return Product::join('product_variants', 'products.id', 'product_variants.product_id')
    //             ->ActiveStandard()
    //             ->whereNotNull('is_variant')
    //             ->select('products.id', 'products.name', 'product_variants.item_code')
    //             ->orderBy('position')->get();
    // }

    public function limsProductSearch(Request $request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");

        $lims_product_data = DB::table('item')->where('ItemCode', $product_code[0])->first();
        // if(!$lims_product_data) {
        //     $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
        //         ->select('products.*', 'product_variants.item_code')
        //         ->where('product_variants.item_code', $product_code[0])
        //         ->first();
        // }
        $product[] = $lims_product_data->ItemName;
        // if($lims_product_data->is_variant)
        //     $product[] = $lims_product_data->item_code;
        // else
        //     $product[] = $lims_product_data->code;

        $barcode_symbology = 'C128';

        $product[] = $lims_product_data->ItemCode;
        $product[] = $lims_product_data->SellingPrice;
        $product[] = DNS1D::getBarcodePNG($lims_product_data->ItemCode, $barcode_symbology);
        $product[] = $lims_product_data->SellingPrice; // promotional price replaced by selling price
        $product[] = config('currency');
        $product[] = config('currency_position');
        return $product;
    }

    public function generateCode()
    {
        $id = Keygen::numeric(8)->generate();
        return $id;
    }

    public function testList(Request $request)
    {

        return view('test_list');
    }

}
