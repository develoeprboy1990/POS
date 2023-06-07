@extends('template.tmp')
@section('page-styles')
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
@endsection
@section('content')
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            <form action="{{ route("appointments.store") }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row">

                            <div class="col-md-6">


                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Client </label>
                                    </div>
                                    <div class="col-sm-9">
                                        <select name="client_id" id="client" class="form-control select2" required>
                                            @foreach($clients as $client)
                                            <option value="{{ $client->PartyID }}" >{{ $client->PartyName }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('client_id'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('client_id') }}
                                        </em>
                                        @endif
                                    </div>
                                </div>


                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Start Time </label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" id="start_time" name="start_time" class="form-control datetime" value="{{ old('start_time', isset($appointment) ? $appointment->start_time : '') }}" required>
                                        @if($errors->has('start_time'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('start_time') }}
                                        </em>
                                        @endif

                                    </div>
                                </div>



                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Price</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="number" id="price" name="price" class="form-control" value="{{ old('price', isset($appointment) ? $appointment->price : '') }}" step="0.01">
                                        @if($errors->has('price'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('price') }}
                                        </em>
                                        @endif

                                    </div>
                                </div>


                            </div>

                            <div class="col-md-6">
                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Employee </label>
                                    </div>
                                    <div class="col-sm-9">
                                        <select name="employee_id" id="employee" class="form-control select2">
                                            @foreach($employees as $id => $employee)
                                            <option value="{{ $id }}" {{ (isset($appointment) && $appointment->employee ? $appointment->employee->id : old('employee_id')) == $id ? 'selected' : '' }}>{{ $employee }}</option>
                                            @endforeach
                                        </select>
                                        @if($errors->has('employee_id'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('employee_id') }}
                                        </em>
                                        @endif
                                    </div>
                                </div>




                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Finish Time </label>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" id="finish_time" name="finish_time" class="form-control datetime" value="{{ old('finish_time', isset($appointment) ? $appointment->finish_time : '') }}" required>
                                        @if($errors->has('finish_time'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('finish_time') }}
                                        </em>
                                        @endif

                                    </div>
                                </div>



                                <div class="mb-1 row">
                                    <div class="col-sm-3">
                                        <label class="col-form-label" for="password">Comments</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <textarea id="comments" name="comments" class="form-control ">{{ old('comments', isset($appointment) ? $appointment->comments : '') }}</textarea>
                                        @if($errors->has('comments'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('comments') }}
                                        </em>
                                        @endif

                                    </div>
                                </div>

                            </div>


                            <div class="form-group {{ $errors->has('services') ? 'has-error' : '' }}">
                                <label for="services">{{ trans('Services') }}
                                    <span class="btn btn-info btn-xs select-all">{{ trans('Select All') }}</span>
                                    <span class="btn btn-info btn-xs deselect-all">{{ trans('Deselect All') }}</span></label>
                                <select name="services[]" id="services" class="form-control select2" multiple="multiple">
                                    @foreach($services as $id => $services)
                                    <option value="{{ $id }}" {{ (in_array($id, old('services', [])) || isset($appointment) && $appointment->services->contains($id)) ? 'selected' : '' }}>{{ $services }}</option>
                                    @endforeach
                                </select>
                                @if($errors->has('services'))
                                <em class="invalid-feedback">
                                    {{ $errors->first('services') }}
                                </em>
                                @endif

                            </div>
                            <div>
                                <input class="btn btn-danger" type="submit" value="{{ trans('Save') }}">
                            </div>



                        </div>
                    </div>
                </div>
            </form>



        </div>
    </div>
</div>

@endsection


@section('page-scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script>
    $(document).ready(function() {
        $('.datetime').datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            locale: 'en',
            sideBySide: true,
            stepping: 15
        });
        $('.select2').select2();

        $('.select-all').click(function() {
            let $select2 = $(this).parent().siblings('.select2');
            $select2.find('option').prop('selected', 'selected');
            $select2.trigger('change')
        })
        $('.deselect-all').click(function() {
            let $select2 = $(this).parent().siblings('.select2');
            $select2.find('option').prop('selected', '');
            $select2.trigger('change');
        })


    });
</script>
@endsection