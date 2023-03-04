<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dish;
use App\Models\DishType;
use App\Models\DishImage;
use App\Models\Item;
use App\Models\DishRecipe;
use App\Models\Unit;
use Image;
use DB;
use Session;
use Illuminate\Validation\Rule;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductBatch;
use App\Models\Customer;
use App\Models\CustomerGroup;
use App\Models\Sale;
use App\Models\PosSetting;
use App\Models\Brand;
use App\Models\Coupon;
use App\Models\Tax;
use App\Models\Product_Sale;
use App\Models\Payment;
use Yajra\DataTables\DataTables;

class DishController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $dishes = Dish::get();
            return Datatables::of($dishes)
                ->addIndexColumn()
                ->addColumn('dish_img', function ($row) {
                    if ($row->image_thumbnail)
                        $dish_img = '<td><img src="'.url('thumbnail', $row->image_thumbnail).'" height="50"></td>';
                    else
                        $dish_img = '<td><img src="'.url('assets/images/product/zummXD2dvAtI.png').'" height="100" width="100"></td>';

                    return $dish_img;
                })
                ->addColumn('status', function ($row) {
                    if ($row->status == 1)
                        $status = 'Active';
                    else
                        $status = 'In-Active';

                    return $status;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('dish.edit', $row->id) . '" target="_blank"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`dishDelete`,' . $row->id . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['dish_img', 'status' ,'action'])
                ->make(true);
        }

        return view('dish.list');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dish.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(
            $request,
            [
                'name.required' => 'Dish Name is required',
            ]
        );
        // dd($request->all());
        $input = $request->except('image_thumbnail');
        $image = $request->file('image_thumbnail');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
            // $destinationPath = public_path('assets/images/dishes');
            // $image->move($destinationPath, $imageName);
            $input['image_thumbnail'] = $imageName;
        }
        $dish = Dish::create($input);
        return redirect()->route('dish.type', $dish->id)->with('error', 'Saved Successfully')->with('class', 'success');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Dish $dish)
    {
        return view('dish.edit-dish',compact('dish'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate(
            $request,
            [
                'name.required' => 'Dish Name is required',
            ]
        );
        $input = $request->except('image_thumbnail');
        $image = $request->file('image_thumbnail');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath.'/'.$imageName);
            // $destinationPath = public_path('assets/images/dishes');
            // $image->move($destinationPath, $imageName);
            $input['image_thumbnail'] = $imageName;
        }
        $dish = Dish::find($id)->update($input);
        return redirect()->route('dish.edit', $id)->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function dishType(Dish $dish)
    {
        $dish_types = DishType::where('dish_id',$dish->id)->get();
        return view('dish.dish-type',compact('dish','dish_types'));
    }

    public function storeDishType(Request $request, $id)
    {
        $this->validate(
            $request,
            [
                'type.required' => 'Dish Type is required',
                'price.required' => 'Dish Price is required',
            ]
        );
        $input = $request->all();
        $input['dish_id'] = $id;
        $dish_type = DishType::create($input);
        return redirect()->route('dish.type', $id)->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function dishImage(Dish $dish)
    {
        $dish_images = DishImage::where('dish_id',$dish->id)->get();
        return view('dish.dish-image',compact('dish','dish_images'));
    }

    public function storeDishImage(Request $request, $id)
    {
        $this->validate(
            $request,
            [
                'title.required' => 'Image Name is required',
            ]
        );
        // dd($request->all());
        $input = $request->all();
        $input['dish_id'] = $id;
        $image = $request->file('image');
        if ($image) {

            $imageName = time().'.'.$image->extension();
            // $destinationPath = public_path('/thumbnail');
            // $img = Image::make($image->path());
            // $img->resize(100, 100, function ($constraint) {
            //     $constraint->aspectRatio();
            // })->save($destinationPath.'/'.$imageName);
            $destinationPath = public_path('assets/images/dishes');
            $image->move($destinationPath, $imageName);
            $input['image'] = $imageName;
        }
        DishImage::create($input);
        return redirect()->route('dish.image', $id)->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function dishRecipe(Dish $dish)
    {
        $dish_types = DishType::where('dish_id',$dish->id)->get();
        $kitchen_items = Item::where('ItemType','resturent')->get();
        $dish_recipes = [];
        foreach($dish_types as $dish_type)
        {
            $dish_recipes[$dish_type->type] = $dish_type->dish_recipe;
        }
        return view('dish.dish-recipe',compact('dish','dish_types','kitchen_items','dish_recipes'));
    }

    public function storeDishRecipe(Request $request, $id)
    {
        $this->validate(
            $request,
            [
                'dish_type_id.required' => 'Select Dish Type',
                'item_id.required' => 'Select Item',
                'base_unit_amount_cooked.required' => 'Enter Base unit need to cook',
                'child_unit_amount_cooked.required' => 'Enter Child unit need to cook',
            ]
        );

        $input = $request->all();
        $input['dish_id'] = $id;
        DishRecipe::create($input);
        return redirect()->route('dish.recipe', $id)->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function getItemUnit($item_id)
    {
        $item = Item::where('ItemID',$item_id)->first();
        $unit = $item->unit;
        if($unit)
            return $unit;
        else
            return;
    }

    public function deleteDishType($id)
    {
        $dish_type = DishType::find($id);
        $dish_type->delete();
        return redirect()->back()->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function deleteDishImage($id)
    {
        $dish_image = DishImage::find($id);
        $file_path = public_path().'/assets/images/dishes/'.$dish_image->image;
        unlink($file_path);
        $dish_image->delete();
        return redirect()->back()->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function deleteDishRecipe($id)
    {
        $dish_recipe = DishRecipe::find($id);
        $dish_recipe->delete();
        return redirect()->back()->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Dish $dish)
    {
        $dish_recipes = $dish->dish_recipes()->delete();
        $dish_types = $dish->dish_types()->delete();
        $dish_images = $dish->dish_images;
        foreach($dish_images as $dish_image)
        {
            $file_path = public_path().'/assets/images/dishes/'.$dish_image->image;
            unlink($file_path);
            $dish_image->delete();
        }
        $thumbnail_path = public_path().'/thumbnail/'.$dish->image_thumbnail;
        unlink($thumbnail_path);
        $dish->delete();
        return redirect()->back()->with('error', 'Deleted Successfully')->with('class', 'success');
    }

    public function createDishOrder()
    {
        $lims_customer_list      = DB::table('party')->where('Active', 'Yes')->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_tax_list           = Tax::where('is_active', true)->get();
        $lims_product_list       = DB::table('item')->selectRaw('ItemID AS id,ItemName as name,ItemCode AS code,ItemImage AS image')->where('isActive',1)->where('IsFeatured',1)->where('ItemType', '!=', 'resturent')->get();

        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }

        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_category_list = DB::table('item_category')->where('type','RES')->get();


        $recent_sale = DB::table('invoice_master')->where('InvoiceNo','like','RES%')->orderBy('InvoiceMasterID', 'desc')->take(10)->get();
        $recent_draft = DB::table('invoice_master')->where('InvoiceNo','like','RES%')->orderBy('InvoiceMasterID', 'desc')->take(10)->get();
     
        $lims_coupon_list = Coupon::where('is_active', true)->get();
        $flag = 0;
        $invoice_no = DB::table('invoice_master')->where('InvoiceNo','like','RES%')->count();
        $invoice_no = 'RES-0000' . ++$invoice_no;
        return view('dish.order-dish', compact('lims_customer_list', 'lims_customer_group_all', 'lims_warehouse_list', 'lims_product_list', 'product_number', 'lims_tax_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'recent_sale', 'recent_draft', 'lims_coupon_list', 'flag', 'invoice_no'));
    }
}
