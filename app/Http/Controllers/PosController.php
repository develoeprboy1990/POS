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
use App\Models\Biller;
use App\Models\Unit;
use App\Models\PosSetting;
use App\Models\Tax;
use App\Models\Payment;
use App\Models\Currency;
use App\Models\Product_Warehouse;
use DNS1D;
use DNS2D;
use Keygen;
use Image;

class PosController extends Controller
{


    public function edit($id)
    {
        $lims_customer_list     = Customer::where('is_active', true)->get();
        $lims_warehouse_list    = Warehouse::where('is_active', true)->get();
        $lims_biller_list       = Biller::where('is_active', true)->get();
        $lims_tax_list          = Tax::where('is_active', true)->get();
        $lims_sale_data         = Sale::find($id);

        $lims_product_sale_data = Product_Sale::where('sale_id', $id)->get();
        return view('teq-invoice.edit_teq_invoice', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data'));
    }

    public function create()
    {
        $items = DB::table('item')->get();
        return view('invoice.create', compact('items'));
    }

    public function createInvoice()
    {
        $items = DB::table('item')->get();
        $categories = DB::table('item_category')->get();
        $salemans = DB::table('salesman')->pluck('name', 'SalesmanID')->toArray();
        $parties = DB::table('party')->get();
        $discount = 0;
        $invoice_no = DB::table('invoice_master')->latest('InvoiceMasterID')->pluck('InvoiceMasterID')->first();
        $invoice_no = 'POS-0000' . ++$invoice_no;
        return view('invoice.create_invoice', compact('items', 'categories', 'salemans', 'parties', 'discount', 'invoice_no'));
    }

    public function searchCategoryWiseItems(Request $request)
    {
        if (is_null($request->category_id))
            $items = DB::table('item')->get();
        else
            $items = DB::table('item')->where('ItemCategoryID', $request->category_id)->get();
        return response()->json($items);
    }

    public function searchSpecificItems(Request $request)
    {
        if (is_null($request->category_id))
            $data = DB::table('item')->where("ItemName", "LIKE", "%{$request->input('query')}%")->get();
        else
            $data = DB::table('item')->where('ItemCategoryID', $request->category_id)->where("ItemName", "LIKE", "%{$request->input('query')}%")->get();

        return response()->json($data);
    }

    public function saveInvoice(Request $request)
    {
        // dd($request->all());
        $product_names = $request->product_name;
        $alerts = $request->alert;
        $product_quantities = $request->product_qty;
        $product_prices = $request->product_price;
        $product_taxes = $request->product_tax;
        $product_discounts = $request->product_discount;
        $product_taxa = $request->taxa;
        $product_disca = $request->disca;
        $product_subtotals = $request->product_subtotal;
        $product_pids = $request->pid;
        $product_units = $request->unit;
        $product_hsns = $request->hsn;
        $product_serials = $request->serial;

        $total_tax = 0;
        foreach ($product_taxa as $tax) {
            $tax = floatval(preg_replace('/[^\d.]/', '', $tax));
            $total_tax += $tax;
        }

        $invoice_no = DB::table('invoice_master')->latest('InvoiceMasterID')->pluck('InvoiceMasterID')->first();
        $invoice_no = 'POS-0000' . ++$invoice_no;

        $sub_total = floatval(preg_replace('/[^\d.]/', '', $request->subtotal));
        $grand_total = floatval(preg_replace('/[^\d.]/', '', $request->total));
        $paid_amount = floatval(preg_replace('/[^\d.]/', '', $request->paid_amount));

        $customer_name = DB::table('party')->where('PartyID', $request->customer_id)->pluck('PartyName')->first();
        $invoice_data = array(
            "InvoiceNo" => $invoice_no,
            "ReferenceNo" => $request->refer,
            "Date" => $request->invoicedate,
            "DueDate" => $request->invocieduedate,
            "PartyID" => $request->customer_id,
            "WalkinCustomerName" => $customer_name,
            "SupplierID" => $request->employee,
            "UserID" => session::get('UserID'),
            "DescriptionNotes" => $request->notes,
            "CustomerNotes" => $request->notes,
            "Tax" => $total_tax,
            "Paid" => $paid_amount,
            "Balance" => $request->remaining_bal,
            "SubTotal" => $sub_total,
            "DiscountAmount" => $request->disc_val,
            "Shipping" => $request->shipping,
            "GrandTotal" => $grand_total,
        );

        $id = DB::table('invoice_master')->insertGetId($invoice_data);

        foreach ($product_names as $key => $p_name) {
            $invoice_detail = array(
                "InvoiceMasterID" => $id,
                "InvoiceNo" => $request->invocieno,
                "ItemID" => $product_pids[$key],
                "Description" => $p_name,
                "PartyID" => $request->customer_id,
                "SupplierID" => $request->employee,
                "Qty" => $product_quantities[$key],
                "Rate" => $product_prices[$key],
                "TaxPer" => floatval(preg_replace('/[^\d.]/', '', $product_taxa[$key])),
                "Tax" => $product_taxes[$key],
                "Total" => floatval(preg_replace('/[^\d.]/', '', $product_subtotals[$key])),
            );

            $insert_detail = DB::table('invoice_detail')->insertGetId($invoice_detail);
        }

        //return response()->json('success');
        return response()->json(['msg' => 'success', 'url' => route('invoice.print', ['id' => $id])]);
    }



    public function editInvoice($InvoiceMasterID)
    {
        $invoice_master = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();
        $invoice_detail = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->get();
        $items          = DB::table('item')->get();
        $categories     = DB::table('item_category')->get();
        $salemans       = DB::table('salesman')->pluck('name', 'SalesmanID')->toArray();
        $parties        = DB::table('party')->get();
        $customer_name  = DB::table('party')->where('PartyID', $invoice_master->PartyID)->pluck('PartyName')->first();
        $discount       = 0;
        return view('invoice.edit_invoice', compact('items', 'categories', 'salemans', 'invoice_detail', 'InvoiceMasterID', 'invoice_master', 'parties', 'discount', 'customer_name'));
    }


    public function updateInvoice(Request $request)
    {
        $invoiceId = $request->InvoiceMasterID;
        $invoice_detail = DB::table('invoice_detail')->where('InvoiceMasterID', $invoiceId)->delete();
        $product_names = $request->product_name;
        $alerts = $request->alert;
        $product_quantities = $request->product_qty;
        $product_prices = $request->product_price;
        $product_taxes = $request->product_tax;
        $product_discounts = $request->product_discount;
        $product_taxa = $request->taxa;
        $product_disca = $request->disca;
        $product_subtotals = $request->product_subtotal;
        $product_pids = $request->pid;
        $product_units = $request->unit;
        $product_hsns = $request->hsn;
        $product_serials = $request->serial;

        $total_tax = 0;
        foreach ($product_taxa as $tax) {
            $tax = floatval(preg_replace('/[^\d.]/', '', $tax));
            $total_tax += $tax;
        }

        $sub_total = floatval(preg_replace('/[^\d.]/', '', $request->subtotal));
        $grand_total = floatval(preg_replace('/[^\d.]/', '', $request->total));
        $paid_amount = floatval(preg_replace('/[^\d.]/', '', $request->paid_amount));

        $customer_name = DB::table('party')->where('PartyID', $request->customer_id)->pluck('PartyName')->first();
        $invoice_data = array(
            "ReferenceNo" => $request->refer,
            "Date" => $request->invoicedate,
            "DueDate" => $request->invocieduedate,
            "PartyID" => $request->customer_id,
            "WalkinCustomerName" => $customer_name,
            "SupplierID" => $request->employee,
            "UserID" => session::get('UserID'),
            "DescriptionNotes" => $request->notes,
            "CustomerNotes" => $request->notes,
            "Tax" => $total_tax,
            "Paid" => $paid_amount,
            "Balance" => $request->remaining_bal,
            "SubTotal" => $sub_total,
            "DiscountPer" => $request->disc_val,
            "Shipping" => $request->shipping,
            "GrandTotal" => $grand_total,
        );

        $id = DB::table('invoice_master')->where('InvoiceMasterID', $invoiceId)->update($invoice_data);

        foreach ($product_names as $key => $p_name) {
            $invoice_detail = array(
                "InvoiceMasterID" => $invoiceId,
                "InvoiceNo"       => $request->invocieno,
                "ItemID"         => $product_pids[$key],
                "Description" => $p_name,
                "PartyID" => $request->customer_id,
                "SupplierID" => $request->employee,
                "Qty" => $product_quantities[$key],
                "Rate" => $product_prices[$key],
                "TaxPer" => floatval(preg_replace('/[^\d.]/', '', $product_taxa[$key])),
                "Tax" => $product_taxes[$key],
                "Total" => floatval(preg_replace('/[^\d.]/', '', $product_subtotals[$key])),
            );

            $insert_detail = DB::table('invoice_detail')->insertGetId($invoice_detail);
        }

        return response()->json('success');
    }




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
        $lims_biller_data = Biller::find($lims_sale_data->SupplierID);
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
                    $btn .= '<a href="' . route('sales.edit',   $row->InvoiceMasterID) . '" class="dropdown-item" target="_blank">Edit Invoice</a><a href="' . route('invoice.show', ['id' => $row->InvoiceMasterID]) . '" class="dropdown-item" target="_blank">View Invoice</a><a href="' . route('invoice.print', ['id' => $row->InvoiceMasterID]) . '" class="dropdown-item" target="_blank">Print Invoice</a><button type="button" class="add-payment dropdown-item" data-id = "'.$row->InvoiceMasterID.'" data-bs-toggle="modal" data-bs-target="#add-payment">'.trans('file.Add Payment').'</button>';
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
                    $no_of_prod = Product_Warehouse::join('item', 'product_warehouse.product_id', '=', 'item.ItemID')
                        ->where([
                            ['product_warehouse.warehouse_id', $row->id]
                        ])->count();
                    return $no_of_prod;
                })
                ->addColumn('stock_qty', function ($row) {
                    $stock_qty = Product_Warehouse::join('item', 'product_warehouse.product_id', '=', 'item.ItemID')
                        ->where([
                            ['product_warehouse.warehouse_id', $row->id]
                        ])->sum('product_warehouse.qty');
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
        $lims_unit_all = Unit::where('is_active', true)->get();
        if ($request->ajax()) {
            return Datatables::of($lims_unit_all)
                ->addIndexColumn()
                ->addColumn('base_unit', function ($row) {
                    if($row->base_unit)
                    $unit_name = DB::table('units')->where('id', $row->base_unit)->pluck('unit_name')->first();
                    else
                    $unit_name = '<td>N/A</td>';

                    return $unit_name;
                })
                ->addColumn('operator', function ($row) {
                    if($row->operator)
                    $operator = $row->operator;
                    else
                    $operator = '<td>N/A</td>';

                    return $operator;
                })
                ->addColumn('operation_value', function ($row) {
                    if($row->operation_value)
                    $operation_value = $row->operation_value;
                    else
                    $operation_value = '<td>N/A</td>';

                    return $operation_value;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_unit" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`unitDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['base_unit','operator','operation_value','action'])
                ->make(true);
        }

        return view('unit_list',compact('lims_unit_all'));
    }
    
    public function storeUnit(Request $request)
    {
        $this->validate($request, [
            'unit_code' => [
                'max:255',
                    Rule::unique('units')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

            'unit_name' => [
                'max:255',
                    Rule::unique('units')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ]

        ]);
        $input = $request->all();
        $input['is_active'] = true;
        if(!$input['base_unit']){
            $input['operator'] = '*';
            $input['operation_value'] = 1;
        }
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
            'unit_code' => [
                'max:255',
                    Rule::unique('units')->ignore($request->unit_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'unit_name' => [
                'max:255',
                    Rule::unique('units')->ignore($request->unit_id)->where(function ($query) {
                    return $query->where('is_active', 1);
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
        $lims_unit_data->is_active = false;
        $lims_unit_data->save();
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
                ->addColumn('stock_qty', function ($row) {
                    $stock_qty = DB::table('item')->where('ItemCategoryID',$row->ItemCategoryID)->where('IsActive', true)->sum('TotalQty');
                    return @$stock_qty;
                })
                ->addColumn('stock_worth', function ($row) {
                    $total_price = DB::table('item')->where('ItemCategoryID',$row->ItemCategoryID)->where('IsActive', true)->sum(DB::raw('SellingPrice * TotalQty'));
                    $total_cost = DB::table('item')->where('ItemCategoryID',$row->ItemCategoryID)->where('IsActive', true)->sum(DB::raw('CostPrice * TotalQty'));
                    $stock_worth = 'USD '.$total_price.' / USD '.$total_cost;
                    return @$stock_worth;
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
            );
        }
        else{
            $data = array(
                "ParentID" => $request->edit_parent_id,
                "title" => $category_name,
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

    public function billerList(Request $request)
    {
        if ($request->ajax()) {
            $biller = Biller::where('is_active', true)->get();
            return Datatables::of($biller)
                ->addIndexColumn()
                ->addColumn('biller_img', function ($row) {
                    if ($row->image)
                        $biller_img = '<td><img src="'.url('thumbnail', $row->image).'"></td>';
                    else
                        $biller_img = '<td><img src="'.url('assets/images/product/zummXD2dvAtI.png').'" height="100" width="100"></td>';

                    return $biller_img;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_biller" data-id="' . $row->id . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`billerDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['biller_img', 'action'])
                ->make(true);
        }

        return view('biller_list');
    }

    public function storeBiller(Request $request)
    {
        $this->validate($request, [
            'company_name' => [
                'max:255',
                Rule::unique('billers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'email' => [
                'email',
                'max:255',
                Rule::unique('billers')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            // 'image' => 'image|mimes:jpg,jpeg,png,gif|max:10000',
        ]);

        $lims_biller_data = $request->except('image');
        $lims_biller_data['is_active'] = true;
        $image = $request->file('image');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
       
            $destinationPath = public_path('assets/images/biller');
            $image->move($destinationPath, $imageName);

            $lims_biller_data['image'] = $imageName;
        }
        Biller::create($lims_biller_data);
        return redirect('biller-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getBillerData(Request $request)
    {
        $lims_biller_data = Biller::where('id', $request->biller_id)->first();
        return response()->json($lims_biller_data);
    }

    public function updateBiller(Request $request)
    {
        $this->validate($request, [
            'company_name' => [
                'max:255',
                Rule::unique('billers')->ignore($request->biller_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'email' => [
                'email',
                'max:255',
                Rule::unique('billers')->ignore($request->biller_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],

            // 'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        ]);

        $input = $request->except('image');
        $image = $request->image;
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
       
            $destinationPath = public_path('assets/images/biller');
            $image->move($destinationPath, $imageName);

            $input['image'] = $imageName;


        }

        $lims_biller_data = Biller::findOrFail($request->biller_id);
        $lims_biller_data->update($input);
        return redirect('biller-list')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function deleteBiller($id)
    {
        $lims_biller_data = Biller::find($id);
        $lims_biller_data->is_active = false;
        $lims_biller_data->save();
        return redirect('biller-list')->with('error', 'Deleted Successfully')->with('class', 'success');
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
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        
        return view('pos_setting', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_pos_setting_data'));
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
        $pos_setting->biller_id = $data['biller_id'];
        $pos_setting->product_number = $data['product_number'];
        $pos_setting->stripe_public_key = $data['stripe_public_key'];
        $pos_setting->stripe_secret_key = $data['stripe_secret_key'];
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

}
