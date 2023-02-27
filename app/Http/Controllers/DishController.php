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

class DishController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $dish_recipes = DishRecipe::where('dish_id',$dish->id)->get();
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
    public function destroy($id)
    {
        //
    }
}
