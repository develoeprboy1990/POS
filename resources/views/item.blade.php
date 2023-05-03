@extends('template.tmp')

@section('title', $pagetitle)
 

@section('content')
<div class="main-content">

                <div class="page-content">
                    <div class="container-fluid"><div class="row">
  <div class="col-12">
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
   <script type="text/javascript">
       function delete_confirm2(url,id) {        


        url = '{{URL::TO('/')}}/'+url+'/'+ id;
        
    
       
            jQuery('#staticBackdrop').modal('show', {backdrop: 'static'});
            document.getElementById('delete_link').setAttribute('href' , url);
         
    } 
 
  </script>
   @if (session('error'))
  
  <div class="alert alert-{{ Session::get('class') }} p-1"  id="success-alert">
                      
                    <strong>{{ Session::get('error') }} </strong>
                  </div>
  
  @endif
  
    @if (count($errors) > 0)
                                   
                              <div >
                  <div class="alert alert-danger p-1 border-1 bg-danger text-white">
                     <p class="font-weight-bold"> There were some problems with your input.</p>
                      <ul>
                          
                          @foreach ($errors->all() as $error)
                              <li>{{ $error }}</li>
  
                          @endforeach
                      </ul>
                  </div>
                  </div>
  
              @endif
  
 <!-- enctype="multipart/form-data" -->
 <form action="{{URL('/ItemSave')}}" enctype="multipart/form-data" method="post"> 
 {{csrf_field()}} 
 <div class="card shadow-sm">
    <div class="card-header">
      <h2>Item</h2>
    </div>
      <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                

                
                 
                
                
                
                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Type</label>
                  </div>
                  <div class="col-sm-9">
                  <div class="form-check form-check-inline pt-2">
                   <input class="form-check-input" type="radio" name="ItemType" id="inlineRadio1" value="Goods" checked {{ old('ItemType') == 'Goods' ? 'checked' : '' }}>
                   <label class="form-check-label" for="inlineRadio1">Goods</label>
                 </div>

                  <div class="form-check form-check-inline pt-2">
                   <input class="form-check-input" type="radio" name="ItemType" id="inlineRadio1" value="Service" {{ old('ItemType') == 'Service' ? 'checked' : '' }}>
                   <label class="form-check-label" for="inlineRadio1">Service</label>
                 </div>

                 <div class="form-check form-check-inline pt-2">
                   <input class="form-check-input" type="radio" name="ItemType" id="inlineRadio1" value="resturent" {{ old('ItemType') == 'resturent' ? 'checked' : '' }}>
                   <label class="form-check-label" for="inlineRadio1">Resturent</label>
                 </div>
                  </div>
                </div>
              

                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Name</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="text" id="first-name" class="form-control" name="ItemName" placeholder="Item Name">
                  </div>
                </div>

                
                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Item Code</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="text" id="item_code" class="form-control" name="ItemCode" placeholder="Item Code">
                  </div>
                </div>

                 <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Taxable</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="Taxable" id="Taxable" class="form-select">
                        <option value="">Select</option>
                        <option value="No" selected="">No</option>
                        <option value="Yes">Yes</option>
                  
                      </select>
                  </div>
                </div>

                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Percentage</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="text" id="Percentage" disabled="" class="form-control" name="Percentage" >
                  </div>
                </div>


              </div>


              <div class="col-md-6">
                <div class="mb-3 mt-5 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Image</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="file" name="image" class="form-control" accept="image/*">
                  </div>
                </div>
                
                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Units</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="unit_id" id="unit_id" class="form-select">
                       <option value="">Select</option>
                 @foreach($units as $unit)
                 <option value="{{$unit->id}}">{{$unit->base_unit}}</option>
                 @endforeach
                      </select>
                  </div>
                </div>
                
                <!-- <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Warehouse</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="warehouse_id" id="warehouse_id" class="form-select">
                       <option value="">Select Warehouse</option>
                       @foreach($lims_warehouse_list as $warehouse)
                        <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                        @endforeach
                      </select>
                  </div>
                </div> -->
                
                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Category</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="item_category_id" id="item_category_id" class="form-select">
                       <option value="">Select Item Category</option>
                       @foreach($item_categories as $category)
                        <option value="{{$category->ItemCategoryID}}">{{$category->title}}</option>
                        @endforeach
                      </select>
                  </div>
                </div>
                

                
                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Brand</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="brand_id" id="brand" class="form-select">
                       <option value="">Select Brand</option>
                       @foreach($lims_brand_all as $brand)
                        <option value="{{$brand->id}}">{{$brand->title}}</option>
                        @endforeach
                      </select>
                  </div>
                </div>

                


              </div>
        </div>
         

      <div class="row mt-5">
        
        <div class="col-md-6">
          
           
                <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label  text-danger" for="first-name">Cost Price</label>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" id="first-name" class="form-control" name="CostPrice" value="{{$item[0]->CostPrice}}" >
                  </div>
                </div>

                <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Active</label>
                  </div>
                  <div class="col-sm-9 mt-2">
                    <input type="checkbox" name="isActive" value="1" checked>
                    <label for="active"> Active</label>
                  </div>
                </div>


     <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label  " for="first-name">Cost Account</label>
                  </div>
                  <div class="col-sm-6">
                    <select name="CostChartofAccountID"  class="select2 form-select">
                       @foreach($chartofaccount as $value)
                        <option value="{{$value->ChartOfAccountID}}" >{{$value->ChartOfAccountID}}-{{$value->ChartOfAccountName}}</option>
                       @endforeach
                    </select>
                  </div>
                </div>
                 
              <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label  " for="first-name">Cost Remarks</label>
                  </div>
                  <div class="col-sm-6">
                   <textarea name="CostDescription" id="" class="form-control" cols="43" rows="3"></textarea>
                  </div>
                </div>   
                
                 
                         

        </div>
        <div class="col-md-6"> 

          <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label  text-danger" for="first-name">Selling Price</label>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" id="first-name" class="form-control" name="SellingPrice" value="{{$item[0]->CostPrice}}" >
                  </div>
                </div>
          

            <div class="mb-3 row">
                  <div class="col-sm-2">
                    <label class="col-form-label fw-bold" for="first-name">Featured</label>
                  </div>
                  <div class="col-sm-9 mt-2">
                    <input type="checkbox" value="1" name="isFeatured">
                    <label for="vehicle2"> Featured</label>
                  </div>
                </div>

            <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label " for="first-name">Selling Account</label>
                  </div>
                  <div class="col-sm-6">
                    <select name="SellingChartofAccountID"  class="form-select select2">
                       @foreach($chartofaccount as $value)
                        <option value="{{$value->ChartOfAccountID}}" >{{$value->ChartOfAccountID}}-{{$value->ChartOfAccountName}}</option>
                       @endforeach
                    </select>
                  </div>
                </div>      

 
        <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label " for="first-name">Selling Remarks</label>
                  </div>
                  <div class="col-sm-6">
                   <textarea name="SellingDescription" id="" class="form-control" cols="43" rows="3"></textarea>
                  </div>
                </div>      


              </div>


      </div>
      </div>
      <div class="card-footer">
        
        <div><button type="submit" class="btn btn-success w-lg float-right">Save</button>
             <a href="{{URL('/')}}" class="btn btn-secondary w-lg float-right">Cancel</a>
        
        
      </div>
  </div>
  
  </div>
  </form>

<!-- card end here -->



<div class="card">
    <div class="card-body">
  @if(count($item)>0)    
  <div class="table-responsive">
        <table class="table table-striped  table-sm  m-0" id="student_table">
<thead><tr>
<th scope="col">S.No</th>
<th scope="col">Type</th>
<th scope="col">Name</th>
<th scope="col">Unit</th>
<th scope="col">Price</th>
<th scope="col">Taxable</th>
<th scope="col">Tax %</th>
<th scope="col">Action</th>
</tr>
</thead>
<tbody>
@foreach ($item as $key =>$value)
 <tr>
 <td class="col-md-">{{$key+1}}</td>
 <td class="col-md-1">{{$value->ItemType}}</td>
 <td class="col-md-7">{{$value->ItemName}}</td>
 <td class="col-md-2">{{$value->unit ? $value->unit->base_unit : 'N/A'}}</td>
 <td class="col-md-2">{{$value->SellingPrice}}</td>
 <td class="col-md-1">{{$value->Taxable}}</td>
 <td class="col-md-1">{{$value->Percentage}}</td>
 <td class="col-md-2"><a href="{{URL('/ItemEdit/'.$value->ItemID)}}"><i class=" text-dark bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2('ItemDelete',{{$value->ItemID}})"><i class="bx bx-trash text-dark  align-middle me-1"></i></a>  </td>
 </tr>
 @endforeach   
 </tbody>
 </table>
</div>
 @else
   <p class=" text-danger">No data found</p>
 @endif 
    </div>
</div>




<div class="card">
  <div class="card-header bg-secondary bg-soft">Import Bulk Data</div>
    <div class="card-body">
      <form method="post" enctype="multipart/form-data" action="{{ url('/ItemImport') }}">
    {{ csrf_field() }}
    <div class="form-group">
     <table class="table">
      <tr>
       <td width="40%" align="right"><label>Select File for Upload</label></td>
       <td width="30">
         <input type="file" name="file1" class="form-control" required>
       </td>
       <td width="30%" align="left">
        <input type="submit" name="upload" class="btn btn-primary" value="Upload">
       </td>
      </tr>
      <tr>
       <td width="40%" align="right"></td>
       <td width="30"><span class="text-muted">.xls, .xslx</span></td>
       <td width="30%" align="left"></td>
      </tr>
     </table>
    </div>
   </form>
    </div>
</div>

  

</div>

        </div>
      </div>
    </div>
    <!-- END: Content-->


         <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<script>
  $(document).on('change ','#Taxable',function(){
  if($('#Taxable').val()=='Yes')
  {
     $("#Percentage").prop("disabled", false);
     $("#Percentage").focus();
     $("#Percentage").attr("placeholder", "5").placeholder();

  }
  else
  {
    $("#Percentage").prop("disabled", true);
    $("#Percentage").removeAttr("placeholder");
  }

  

});


 

 

</script>

 




</script>
<script type="text/javascript">
$(document).ready(function() {
     $('#student_table').DataTable( );
});
</script>

    <!-- my own model -->
 <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
           <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Confirmation</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
         <div class="modal-body">
         <p class="text-center">Are you sure to delete this information ?</p>
         <p class="text-center">
            
            
 
<a href="#" class="btn btn-danger " id="delete_link">Delete</a>
                    <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancel</button>
                    
         </p>
         </div>
              
         </div>
    </div>
 </div>
<!-- end of my own model -->

<!-- <script>
  window.onbeforeunload = function() {
  return 'Your changes will be lost!';
};
</script> -->

 

 
 
  @endsection


