@extends('template.tmp')
@section('title', 'Unit Listing')
@section('content')
 <div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">Unit Listing</h4>

                        <div class="page-title-right">
                             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUnitModal">Add Unit</button>
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
        <div class="modal fade" id="addUnitModal" tabindex="-1" role="dialog" aria-labelledby="addUnitModal" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="addUnitModalTitle">Add Unit</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="{{url('store-unit')}}" method="POST">
                    @csrf
                    <div class="row col-md-12">
                        <div class="form-group">
                            <label for="code">Code</label>
                            <input type="text" name="unit_code" class="form-control" placeholder="Type Unit Code" required>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="unit_name" class="form-control" placeholder="Type Unit Name" required>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3">
                        <div class="form-group">
                            <label for="base_unit">Base Unit</label>
                            <select class="form-control" id="base_unit_create" name="base_unit">
                                <option value="">No Base Unit</option>
                                @foreach($lims_unit_all as $unit)
                                    @if($unit->base_unit==null)
                                    <option value="{{$unit->id}}">{{$unit->unit_name}}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3 operator">
                        <div class="form-group">
                            <label>Operator</label>
                            <input type="text" name="operator" placeholder="Enter Operator" class="form-control" />
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3 operation_value">
                        <div class="form-group">
                            <label>Operation Value</label>
                            <input type="number" name="operation_value" placeholder="Enter operation value" class="form-control" step="any"/>
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
        <div class="modal fade" id="editUnitModal" tabindex="-1" role="dialog" aria-labelledby="editUnitModal" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="editUnitModalTitle">Edit Brand</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="{{url('update-unit')}}" method="POST">
                    @csrf
                    <input type="hidden" name="unit_id" value="" id="unit_id">
                    <div class="row col-md-12">
                        <div class="form-group">
                            <label for="code">Code</label>
                            <input type="text" name="unit_code" id="edit_unit_code" class="form-control" required>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" name="unit_name" id="edit_unit_name" class="form-control" required>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3">
                        <div class="form-group">
                            <label for="edit_base_unit">Base Unit</label>
                            <select class="form-control" id="base_unit_edit" name="base_unit">
                                <option value="">No Base Unit</option>
                                @foreach($lims_unit_all as $unit)
                                    @if($unit->base_unit==null)
                                    <option value="{{$unit->id}}">{{$unit->unit_name}}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3 operator">
                        <div class="form-group">
                            <label>Operator</label>
                            <input type="text" name="operator" id="operator" placeholder="Enter Operator" class="form-control" />
                        </div>
                        
                    </div>
                    <div class="row col-md-12 mt-3 operation_value">
                        <div class="form-group">
                            <label>Operation Value</label>
                            <input type="number" name="operation_value" id="operation_value" placeholder="Enter operation value" class="form-control" step="any"/>
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
                    <h4 class="card-title mb-4">Brands</h4>


                    <table class="table datatable table-hover dt-responsive nowrap w-100 table-sm">
                        <thead>
                        <tr>
                            <th scope="col" >S.No</th>
                            <th scope="col">Code</th>
                            <th scope="col">Name</th>
                            <th scope="col">Base Unit</th>
                            <th scope="col">Operator</th>
                            <th scope="col">Operation Value</th>
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
            "ajax": "{{ url('unit-list') }}",
            "columns":[
                {data: 'DT_RowIndex', name: 'DT_RowIndex', orderable:false, searchable: false},
                { "data": "unit_code" },
                { "data": "unit_name" },
                { "data": "base_unit", name: 'base_unit' },
                { "data": "operator", name: 'operator' },
                { "data": "operation_value", name: 'operation_value' },
                { "data": "action" }
            ]
             
         });

        $(".operator").hide();
        $(".operation_value").hide();

        $('#base_unit_create').on('change', function() {
            if($(this).val()){
                $("#addUnitModal .operator").show();
                $("#addUnitModal .operation_value").show();
            }
            else{
                $("#addUnitModal .operator").hide();
                $("#addUnitModal .operation_value").hide();
            }
        });

        $('#base_unit_edit').on('change', function() {
            if($(this).val()){
                $("#editUnitModal .operator").show();
                $("#editUnitModal .operation_value").show();
            }
            else{
                $("#editUnitModal .operator").hide();
                $("#editUnitModal .operation_value").hide();
            }
        });

        $(document.body).on('click','.edit_unit',function(){
            var unit_id = $(this).data('id');
            $.ajax({
                url: "{{url('get-unit-detail')}}",
                dataType: 'JSON',
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: {
                    unit_id: unit_id,
                },
                success: function(data) {
                    if(data){
                        $("#unit_id").val(data.id);
                        $("#edit_unit_code").val(data.unit_code);
                        $("#edit_unit_name").val(data.unit_name);
                        $("#operator").val(data.operator);
                        $("#operation_value").val(data.operation_value);
                        $("#base_unit_edit").val(data.base_unit);
                        if(data.base_unit!=null)
                        {
                            $(".operator").show();
                            $(".operation_value").show();
                        }
                        else
                        {
                            $(".operator").hide();
                            $(".operation_value").hide();
                        }
                        $('#editUnitModal').modal('show');
                    }
                }
            });

        });


     });
 </script>   
@endsection