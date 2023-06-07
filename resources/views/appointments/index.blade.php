@extends('template.tmp')

@section('title', $pagetitle)

@section('page-styles')
@endsection

@section('content') 


<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">{{$pagetitle}}</h4>
                        <a href="{{ route('appointments.create') }}" class="btn btn-primary w-md float-right "><i class="bx bx-plus"></i> Add New</a>
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

                    <div>
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
                            <table class="table table-bordered table-striped table-hover ajaxTable datatable datatable-Appointment">
                                <thead>
                                    <tr> 
                                        <th>Start time
                                        </th>
                                        <th> Finish Time
                                        </th>
                                        <th>
                                            Price
                                        </th>
                                        <th>
                                            Comments
                                        </th>
                                        <th>
                                            Actions
                                        </th>

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
@endsection
@section('page-scripts')
<script>
    $(function() {
        var table = $('.datatable-Appointment').DataTable({
            lengthMenu: [
                [100, 200, 300, 400, 500, 600, -1],
                [100, 200, 300, 400, 500, 600, "All"]
            ],
            pageLength: 100,
            ajax: {
                url: "{!! route('appointments.index') !!}",
            },
            columns: [{
                    data: 'start_time',
                    name: 'start_time'
                },
                {
                    data: 'finish_time',
                    name: 'finish_time'
                },
                {
                    data: 'price',
                    name: 'price'
                },
                {
                    data: 'comments',
                    name: 'comments'
                },

                {
                    data: 'actions'
                }
            ], 
            buttons: [{
                    extend: 'csv',
                    exportOptions: {
                        columns: [0, 1, 3, 4, 5, 6]
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [0, 1, 3, 4, 5, 6]
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [0, 1, 3, 4, 5, 6]
                    }
                },
            ],
            title: ' ',
            responsive: true,
            processing: true,
            serverSide: true,
            searching: true,
            sorting: true,
        });
    });
</script>
@endsection