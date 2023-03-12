<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dish;
use App\Models\DishType;
use App\Models\DishImage;
use App\Models\Item;
use App\Models\DishRecipe;
use App\Models\Unit;
use App\Models\DishTable;
use App\Models\InvoiceDishDetail;
use Image;
use DB;
use session;
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
        return view('dish.create'); //create page
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

    public function dishType(Dish $dish, $dish_type_id = null)
    {
        $dish_types = DishType::where('dish_id',$dish->id)->get();
        if($dish_type_id)
            $dish_type = $dish_types->firstWhere('id',$dish_type_id);
        else
            $dish_type = $dish_type_id;
            

        return view('dish.dish-type',compact('dish','dish_types','dish_type'));
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
        if($input['dish_type_id']){
            $dish_type = DishType::findOrFail($input['dish_type_id']);
            $dish_type->type = $input['type'];
            $dish_type->price = $input['price'];
            $dish_type->save();
        }
        else{
            $input['dish_id'] = $id;
            $dish_type = DishType::create($input);
        }
        
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

    public function dishRecipe(Dish $dish, $dish_type_id = null, $item_id = null)
    {
        $dish_types = DishType::where('dish_id',$dish->id)->get();
        if($dish_type_id){
            $dish_type_recipe = DishRecipe::where([
                'dish_id' => $dish->id,
                'dish_type_id' => $dish_type_id,
                'item_id' => $item_id
            ])->first();
            $item = Item::where('ItemID',$item_id)->first();
            $item_unit = $item->unit;
        }
        else{
            $dish_type_recipe = $dish_type_id;
            $item_unit = $item_id;
        }


        $kitchen_items = Item::where('ItemType','resturent')->get();
        $dish_recipes = [];
        foreach($dish_types as $dish_type)
        {
            $dish_recipes[$dish_type->type] = $dish_type->dish_recipe;
        }
        return view('dish.dish-recipe',compact('dish','dish_types','kitchen_items','dish_recipes','dish_type_recipe','item_unit'));
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
        if($input['dish_type_recipe_id']){
            $dish_type_recipe = DishRecipe::findOrFail($input['dish_type_recipe_id']);
            $dish_type_recipe->dish_type_id = $input['dish_type_id'];
            $dish_type_recipe->item_id = $input['item_id'];
            $dish_type_recipe->base_unit_amount_cooked = $input['base_unit_amount_cooked'];
            $dish_type_recipe->child_unit_amount_cooked = $input['child_unit_amount_cooked'];
            $dish_type_recipe->save();
        }
        else{
            $input['dish_id'] = $id;
            DishRecipe::create($input);
        }
        
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
        $dish_type_recipe = $dish_type->dish_recipe;
        if($dish_type_recipe->isNotEmpty())
            return redirect()->back()->with('error', 'Dish Recipe exist of Selected Dish type! Delete its recipe first')->with('class', 'danger');
        else
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
        $pagetitle='Order Dish';
        $tax = DB::table('tax')->get();
        $dishes = Dish::orderBy('name')->pluck('name','id')->toArray();
        $dish_tables = DishTable::orderBy('id')->get();
        $invoice_no = DB::table('invoice_master')->where('InvoiceNo','like','RES%')->count();
        $invoice_no = 'RES-0000' . ++$invoice_no;
        return view('dish.order-dish', compact('invoice_no','pagetitle','tax','dishes','dish_tables'));
    }

    public function getDishTypes(Request $request)
    {
        $dish_types = DishType::where('dish_id',$request->dish_id)->get();
        return response()->json($dish_types);
    }

    public function getDishTypeDetail(Request $request)
    {
        $dish_type_detail = DishType::findOrFail($request->item_idd);
        return response()->json($dish_type_detail);
    }

    public function saveOrderDish(Request $request)
    {
        $invoice_no = DB::table('invoice_master')->where('InvoiceNo','like','RES%')->count();
        $invoice_no = 'RES-0000' . ++$invoice_no;
        $today_date = date('Y-m-d');
        if (!empty($request->invoice_date))
            $today_date = $request->invoice_date;

        $reference_no = date("his");
        $paying_method = 'Cash';

        $invoice_mst = array(
          'InvoiceNo' => $invoice_no, 
          'Date' => $today_date, 
          'DueDate' => $today_date, 
          'DishTableID' => $request->dish_table_id, 
          'WalkinCustomerName' => $request->WalkinCustomerName, 
          'ReferenceNo' => $reference_no, 
          'PaymentMode' => $paying_method, 
          // 'PaymentDetails' => $request->PaymentDetails, 
          // 'Subject' => $request->Subject, 
          'SubTotal' => $request->SubTotal, 
          'DiscountPer' => $request->DiscountPer, 
          'DiscountAmount' => $request->DiscountAmount, 
          'Total' => $request->Total, 
          'TaxPer' => $request->Taxpercentage, 
          'Tax' => $request->grandtotaltax, 
          'Shipping' => $request->Shipping, 
          'GrandTotal' => $request->Grandtotal, 
          'Paid' => $request->Grandtotal, 
          'Balance' => $request->amountDue, 
          // 'CustomerNotes' => $request->CustomerNotes,               
          // 'DescriptionNotes' => $request->DescriptionNotes,               
          'UserID' => session::get('UserID'), 
        );

        $InvoiceMasterID = DB::table('invoice_master')->insertGetId($invoice_mst);
        $dish_types = $request->ItemID;
 

        foreach ($dish_types as $key => $dish_type_id) {
            $dish_type = DishType::findOrFail($dish_type_id);            

            $invoice_dish_detail = new InvoiceDishDetail();
            $invoice_dish_detail->invoice_master_id = $InvoiceMasterID;
            $invoice_dish_detail->dish_id = $dish_type->dish_id;
            $invoice_dish_detail->dish_type_id = $dish_type_id;
            $invoice_dish_detail->save();

            $dish_items = $dish_type->dish_recipe;
            foreach($dish_items as $dish_item)
            {
                $item_name = DB::table('item')->where('ItemID', $dish_item->item_id)->pluck('ItemName')->first();
                $invoice_det = array (
                    'InvoiceMasterID' =>  $InvoiceMasterID, 
                    'InvoiceNo' => $invoice_no, 
                    'dish_id' => $dish_type->dish_id,
                    'dish_type_id' => $dish_type_id,
                    'ItemID' => $dish_item->item_id,
                    "Description" => $item_name,
                    'Qty' => $dish_item->base_unit_amount_cooked,
                    // 'TaxPer' => $request->Tax[$key],
                    // 'Tax' => $request->TaxVal[$key],
                    // 'Rate' => $request->Price[$key],
                    // 'Total' => $request->ItemTotal[$key],
                
                );

                $id = DB::table('invoice_detail')->insertGetId($invoice_det);
            }

            
        }
        return redirect('create-dish-order')->with('error', 'Order Placed Successfully')->with('class', 'success');
    }

    
}
