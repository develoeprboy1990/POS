@extends('tmp')
@section('title', $pagetitle)

@section('page-styles')
<style>
    .invalid-feedback {
        display: block !important;
    }

    #overlay {
        position: fixed;
        top: 0;
        z-index: 100;
        width: 100%;
        height: 100%;
        display: none;
        background: rgba(0, 0, 0, 0.6);
    }

    .cv-spinner {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .spinner {
        width: 40px;
        height: 40px;
        border: 4px #ddd solid;
        border-top: 4px #2e93e6 solid;
        border-radius: 50%;
        animation: sp-anime 0.8s infinite linear;
    }

    @keyframes sp-anime {
        100% {
            transform: rotate(360deg);
        }
    }

    .is-hide {
        display: none;
    }
</style>
@endsection
@section('content')
<div id="overlay">
    <div class="cv-spinner">
        <span class="spinner"></span>
    </div>
</div>
<div class="main-content">



    <div class="page-content">
        <div class="container-fluid">
            <div class="card-header">
                <h2>Transfer Items From One Warehouse To Another Warehouse</h2>
            </div>
            <form action="{{route('warehouse.stock-warehouse-transfer')}}" method="post" name="form1" id="form1">
                @csrf
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="alert alert-primary" role="alert">
                                <strong>Transfer</strong> Select warehose carefully.
                            </div>

                            <div class="alert alert-danger" role="alert" style="display:none">
                                <strong>Oh snap!</strong> Change a few things up and try submitting again.
                            </div>
                            <div class="alert alert-success" role="alert" style="display:none">
                                <strong>Success !</strong> Selected item has been transfered to warehouse.
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <div class="mb-1">
                                    <label for="basicpill-firstname-input">From Ware House</label>
                                    <select name="from_warehouse_id" id="from_warehouse_id" class="select2 form-select my_class" onchange="getValue(this);" data-id='shah'>
                                        <option value="">All WareHouses</option>
                                        @foreach ($warehouses as $key => $value)
                                        <option value="{{$value->id}}">{{$value->name}}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="warehouseid" id="warehouseid" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-1">
                                    <label for="basicpill-firstname-input">To Ware House</label>
                                    <select name="to_warehouse_id" id="to_warehouse_id" class="select2 form-select my_class" id="select2-basic">
                                        <option value="">All WareHouses</option>

                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row products">

                            <div class="mb-3 row">
                                <div class="col-sm-4">
                                    <div class="mb-1">
                                        <label for="ItemID">Products in the selected warehouse</label>
                                        <select name="ItemID" id="ItemID" class="select2 form-select my_class" onchange="getProductValue(this);">


                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label for="qty">Enter Quantity</label>
                                    <input type="number" id="qty" class="form-control" name="qty" placeholder="Enter Quantity" min="1" max="3">

                                </div>

                                <div class="col-sm-4">
                                    <label for="qty"> </label>

                                    <div class="col-sm-2"> <button type="button" class="btn btn-success w-lg float-right add_input" id="submit">Add</button>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-footer bg-light">
                            <button type="submit" class="btn btn-success w-lg float-right" id="submit">Transfer Products</button>

                            <button type="reset" class="btn btn-secondary w-lg float-right" id="submit">Reset</button>
                        </div>

                        <hr class="invoice-spacing">
                        <div class='row'>
                            <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                                <table>
                                    <thead>
                                        <tr class="bg-light borde-1 border-light " style="height: 40px;">
                                            <th width="10%">ITEM DETAILS</th>
                                            <th width="4%">QUANTITY</th>
                                            <th width="4%">Stock QUantity</th>
                                            <th width="4%">Price</th>
                                            <th width="4%">Total Price</th>
                                            <th width="4%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="form-group">
                                    </tbody>
                                </table>
                            </div>
                        </div>



                    </div><!-- card-body -->






            </form>
        </div>
    </div>

</div>
</div>
</div>
<!-- END: Content-->


@endsection


@section('page-scripts')

<script>
    // Let's stick things in a closure, so it's nice and tidy
    (function() { // Create the event handler on the document ready event, as we know then that the DOM document that was initially loaded
        // will be rendered about now.
        document.addEventListener('DOMContentLoaded', function() { // Get each of the elements

            $(document).on('change keyup blur ', '.changesNo', function() {
                id_arr = $(this).attr('id');
                id = id_arr.split("_");
                var ItemID = $(this).val();
                var quantity = $('#quantity_' + id[1]).text();
                var stockQuantity = parseInt(quantity) - parseInt(ItemID);
                $('#quantity_23').text(stockQuantity);
                console.log(stockQuantity);
            });

        });
    })();
    $(document).ready(function() {



        var limit = 5; //Set limit for input fields
        var group = $(".form-group"); //Input Field Group
        var add_button = $(".add_input"); //Add input field button 
        //Action for add input button click
        $(add_button).click(function(e) {
            e.preventDefault();
            getProductDetails(group);
        });
        //Action for remove input button click
        $(group).on("click", ".remove_field", function(e) {
            e.preventDefault();
            $(this).closest("tr").remove();
            $(this).parent('tr').remove();
            console.log('shah');
        });

        $(document).ajaxSend(function() {
            $("#overlay").fadeIn(300);
        });

        $(document).ajaxComplete(function() {
            $("#overlay").fadeOut(300);
        });
    });

    function getValue(option) {
        var warehouseId = option.value;
        $('#warehouseid').val(warehouseId);
        let url = "{{route('warehouse.fetchwarehouses',':warehouseId')}}";
        route = url.replace(':warehouseId', warehouseId);
        $.ajax({
            url: route,
            type: "GET",
            dataType: 'JSON',
            processData: false,
            contentType: false,
            beforeSend: function() {}
        }).done(function(response) {

            var html = '<option vale="">Please Select Warehouse</option>';
            $.each(response['warehouses'], function(key, value) {
                html += '<option value="' + value.id + '">' + value.name + '</option>';

            });
            $('#to_warehouse_id').html(html);
            if (response['products'].length !== 0) {

                var product = '<option vale="">Please Chose Item</option>';
                $.each(response['products'], function(key, value) {
                    product += '<option value="' + value.ItemID + '">' + value.ItemName + '</option>';

                });
            } else {

                var product = '<option vale="">No Items Found.</option>';
            }
            $('#ItemID').html(product);

        }); // DONE ENDS HERE
    }


    function getProductDetails(group) {
        var product_id = $('#ItemID').val();
        var warehouseid = $('#warehouseid').val();
        let url = "{{route('warehouse.getproductdetais',[':warehouseid',':product_id'])}}";
        route = url.replace(':warehouseid', warehouseid);
        route = route.replace(':product_id', product_id);
        $.ajax({
            url: route,
            type: "GET",
            dataType: 'html',
            processData: false,
            contentType: false,
            beforeSend: function() {}
        }).done(function(response) {
            $(group).append(response); //add input field
        }); // DONE ENDS HERE
    }

    function getProductValue(option) {
        var product_id = option.value;
        var warehouseid = $('#warehouseid').val();
        let url = "{{route('warehouse.checkqty',[':warehouseid',':product_id'])}}";
        route = url.replace(':warehouseid', warehouseid);
        route = route.replace(':product_id', product_id);
        $.ajax({
            url: route,
            type: "GET",
            dataType: 'JSON',
            processData: false,
            contentType: false,
            beforeSend: function() {}
        }).done(function(response) {
            $('#qty').val(response.qty);
            // Set the maximum value to 20
            $("#qty").attr("max", response.qty);
        }); // DONE ENDS HERE
    }

    $('#form1').submit(function(event) {
        // Stop form from submitting normally
        event.preventDefault();
        // Get form data
        // var formData = $(this).serialize();
        let formData = new FormData(this);
        let url = "{{route('warehouse.stock-warehouse-transfer')}}";
        $.ajax({
            type: 'POST',
            url: url,
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            beforeSend: function() {
                $("#submit").attr('disabled', true);
            },
            success: function(response) {
                $("#submit").attr('disabled', false);
                $('.alert-danger').hide();
                if (response) {
                    $("#overlay").fadeOut(300);
                    $('.alert-success').show();
                    $("#form1").reset();
                    $(':input', '#form1')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                }
                //Handle success response
            }
        }).fail(function(jqXHR, textStatus) {
            $("#submit").attr('disabled', false);
            var alert_danger = '';
            $.each(jqXHR.responseJSON.errors, function(field_name, error) {
                // $(document).find('[name=' + field_name + ']').after('<div class="invalid-feedback">' + error + '</div>');
                alert_danger += error + '<br/>';
            });
            $('.alert-danger').show();
            $('.alert-danger').html(alert_danger);
            // console.log(jqXHR);
            //onsole.log(textStatus);

            //showing validation errors here? and how to show?
        });



    });
</script>

@endsection