@extends('template.tmp')

@section('title', 'Bill')
 

@section('content')


 


<div class="main-content">

 <div class="page-content">
 <div class="container-fluid">




    <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0 font-size-18">Bill</h4>
                                        <a href="{{URL('/BillCreate')}}"  class="btn btn-danger w-md float-right "><i class="bx bx-plus"></i> Add New</a>

                                   

                                </div>
                            </div>
                        </div>



          <div class="row">
  <div class="col-12">
  
  @if (session('error'))

 <div class="alert alert-{{ Session::get('class') }} p-1" id="success-alert">
                    
                   {{ Session::get('error') }}  
                </div>

@endif

 @if (count($errors) > 0)
                                 
                            <div >
                <div class="alert alert-danger p-1   border-3">
                   <p class="font-weight-bold"> There were some problems with your input.</p>
                    <ul>
                        
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>

                        @endforeach
                    </ul>
                </div>
                </div>
 
            @endif

            
  <div class="card">
     
      <div class="card-body">
          <table id="student_table" class="table table-striped table-sm " style="width:100%">
        <thead>
            <tr>
                <th>Invoice#</th>
                <th class="col-md-1">Code</th>
                <th class="col-md-3">Supplier</th>
                <th class="col-md-3">WareHouse</th>
                <th class="col-md-2">Date</th>
                <th class="col-md-2">Payment Mode</th>
                <th>Total</th>
                <th>Paid</th>
                <th>Balance</th>
                <th>Action</th>
             </tr>
        </thead>
    </table>
      </div>
  </div>
  
  </div>
</div>

        </div>
      </div>
    </div>
    <!-- END: Content-->
<script type="text/javascript">
$(document).ready(function() {
     $('#student_table').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": "{{ url('ajax_bill') }}",
        "columns":[
            { "data": "InvoiceMasterID" },
            { "data": "InvoiceNo" },
            { "data": "SupplierName" },
            { "data": "WarehouseName" },
            { "data": "Date" },
            { "data": "PaymentMode" },
            { "data": "Total" },
            { "data": "Paid" },
            { "data": "Balance" },
            { "data": "action" },
            
        ],
        "order": [[0, 'desc']],
     });


 $(document).ready(function() {
                    $('#student_table  tr').clone(true).appendTo( '#student_table thead' );
                    $('#student_table thead tr:eq(1) th').each( function (i) {
                        var title = $(this).text();
                        $(this).html( '<input type="text" placeholder=" Search '+title+'"  class="form-control form-control-sm" />' );


// hide text field from any column you want too
if (title == 'Action') {
    $(this).hide();
  }
    

    if (title == 'Balance') {
    $(this).hide();
  }
    

 


                        $( 'input', this ).on( 'keyup change', function () {
                        
                            if ( table.column(i).search() !== this.value ) {
                                table
                                    .column(i)
                                    .search( this.value )
                                    .draw();
                            }
                        });
                        
                    });
                    var table = $('#student_table').DataTable( {
                        orderCellsTop: false,
                        fixedHeader: true,
                        retrieve: true,
                        paging: false

                    });
                });



});
</script>

      <!-- BEGIN: Vendor JS-->
    <script src="{{asset('assets/vendors/js/vendors.min.js')}}"></script>
    <!-- BEGIN Vendor JS-->


  @endsection