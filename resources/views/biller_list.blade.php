@extends('template.tmp')
@section('title', 'Biller Listing')
@section('content')
 <div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">Biller Listing</h4>

                        <div class="page-title-right">
                             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBillerModal">Add Biller</button>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->
            <div class="row">
                <div class="col-xl-12">
                     @if (session('error'))
                        <div class="alert alert-{{ Session::get('class') }} p-3">
                                        
                                      <strong>{{ Session::get('error') }} </strong>
                                    </div>
                    @endif

                    @if (count($errors) > 0) 
                        <div >
    <div class="alert alert-danger pt-3 pl-0   border-3 bg-danger text-white">
       <p class="font-weight-bold"> There were some problems with your input.</p>
        <ul>
            
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>

            @endforeach
        </ul>
    </div>
    </div>
                    @endif


        <!-- Add Modal -->
        <div class="modal fade" id="addBillerModal" tabindex="-1" role="dialog" aria-labelledby="addBillerModalTitle" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="addBillerModalTitle">Add Biller</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="{{url('store-biller')}}" method="POST">
                    @csrf
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="image">Image</label>
                                <input type="file" name="image" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="c_name">Company Name</label>
                                <input type="text" name="company_name" class="form-control" required>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="vat">VAT Number</label>
                                <input type="text" name="vat_number" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" placeholder="example@example.com" required class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="text" name="phone_number" required class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="address" required class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="city">City</label>
                                <input type="text" name="city" required class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="state">State</label>
                                <input type="text" name="state" class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="postal_code">Postal Code</label>
                                <input type="text" name="postal_code" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="country">Country</label>
                                <input type="text" name="country" class="form-control">
                            </div>
                            
                        </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="sumbit" class="btn btn-success">Save</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>


        <!-- Edit Modal -->
        <div class="modal fade" id="editBillerModal" tabindex="-1" role="dialog" aria-labelledby="editBillerModalTitle" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="editBillerModalTitle">Edit Biller</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="{{url('update-biller')}}" method="POST">
                    @csrf
                    <input type="hidden" name="biller_id" value="" id="biller_id">
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" class="form-control" id="name" required>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="image">Image</label>
                                <input type="file" name="image" id="image" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="c_name">Company Name</label>
                                <input type="text" name="company_name" id="company_name" class="form-control" required>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="vat">VAT Number</label>
                                <input type="text" name="vat_number" id="vat_number" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" placeholder="example@example.com" required class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="text" name="phone_number" id="phone_number" required class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="address" id="address" required class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="city">City</label>
                                <input type="text" name="city" id="city" required class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="state">State</label>
                                <input type="text" name="state" id="state" class="form-control">
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="postal_code">Postal Code</label>
                                <input type="text" name="postal_code" id="postal_code" class="form-control">
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="country">Country</label>
                                <input type="text" name="country" id="country" class="form-control">
                            </div>
                            
                        </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="sumbit" class="btn btn-success">Update</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>

            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Salesman List</h4>


                    <table class="table datatable table-hover dt-responsive nowrap w-100 table-sm">
                        <thead>
                        <tr>
                            <th scope="col">S.No</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Company Name</th>
                            <th scope="col">VAT Number</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone Number</th>
                            <th scope="col">Address</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>


                        <tbody>
                            
                        </tbody>
                    </table>
                          
                </div>
                <!-- end card body -->
            </div>
                    <!-- end card -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->  
        </div> <!-- container-fluid -->
    </div>
 <script type="text/javascript">
     $(document).ready(function(){

        $('.datatable').DataTable({
            "processing": true,
            "serverSide": true,
            "pageLength":50,
            "ajax": "{{ url('biller-list') }}",
            "columns":[
                {data: 'DT_RowIndex', name: 'DT_RowIndex', orderable:false, searchable: false},
                { "data": "biller_img", name:"biller_img" },
                { "data": "name" },
                { "data": "company_name" },
                { "data": "vat_number" },
                { "data": "email" },
                { "data": "phone_number" },
                { "data": "address" },
                { "data": "action" }
            ]
             
         });

        $(document.body).on('click','.edit_biller',function(){
            var biller_id = $(this).data('id');
            if(biller_id){
                $.ajax({
                    url:'{{ url("/get-biller-data") }}',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    method:"GET",
                    data:{biller_id:biller_id},
                    dataType:"JSON",
                    success:function(data)
                    {
                        if(data)
                        {
                            $('#biller_id').val(data.id);
                            $('#image').val(data.image);
                            $('#company_name').val(data.company_name);
                            $('#name').val(data.name);
                            $('#vat_number').val(data.vat_number);
                            $('#email').val(data.email);
                            $('#phone_number').val(data.phone_number);
                            $('#address').val(data.address);
                            $('#city').val(data.city);
                            $('#state').val(data.state);
                            $('#country').val(data.country);
                            $('#postal_code').val(data.postal_code);
                            $('#editBillerModal').modal('show'); 
                        }
                        
                    }
                });
            }
        });


     });
 </script>   
@endsection