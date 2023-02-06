@extends('template.tmp') 

@push('after-styles')
<link rel="manifest" href="{{url('manifest.json')}}">
  <!-- Bootstrap CSS-->
  <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/bootstrap.min.css') ?>" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css') ?>" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/bootstrap-datepicker.min.css') ?>" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('vendor/jquery-timepicker/jquery.timepicker.min.css') ?>" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/awesome-bootstrap-checkbox.css') ?>" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/bootstrap-select.min.css') ?>" type="text/css">
  <!-- Font Awesome CSS-->
  <link rel="stylesheet" href="<?php echo asset('vendor/font-awesome/css/font-awesome.min.css') ?>" type="text/css">
  <!-- Drip icon font-->
  <link rel="stylesheet" href="<?php echo asset('vendor/dripicons/webfont.css') ?>" type="text/css">
  <!-- Google fonts - Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,500,700">
  <!-- jQuery Circle-->
  <link rel="stylesheet" href="<?php echo asset('css/grasp_mobile_progress_circle-1.0.0.min.css') ?>" type="text/css">
  <!-- Custom Scrollbar-->
  <link rel="stylesheet" href="<?php echo asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css') ?>" type="text/css">
  <!-- virtual keybord stylesheet-->
  <link rel="stylesheet" href="<?php echo asset('vendor/keyboard/css/keyboard.css') ?>" type="text/css">
  <!-- date range stylesheet-->
  <link rel="stylesheet" href="<?php echo asset('vendor/daterange/css/daterangepicker.min.css') ?>" type="text/css">
  <!-- table sorter stylesheet-->
  <link rel="stylesheet" type="text/css" href="<?php echo asset('vendor/datatable/dataTables.bootstrap4.min.css') ?>">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
  <link rel="stylesheet" href="<?php echo asset('css/style.default.css') ?>" id="theme-stylesheet" type="text/css">
  <link rel="stylesheet" href="<?php echo asset('css/dropzone.css') ?>">
  <link rel="stylesheet" href="<?php echo asset('css/style.css') ?>">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
         <!-- Custom stylesheet - for your changes-->
     <link rel="stylesheet" href="{{URL('/')}}/css/custom-default.css" type="text/css" id="custom-style">
@endpush
@section('content')
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div> 
@endif 
<div class="main-content">
    <div class="page-content">
        <section class="forms">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header d-flex align-items-center">
                                <h4>{{trans('file.print_barcode')}}</h4>
                            </div>
                            <div class="card-body">
                                <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>{{trans('file.add_product')}} *</label>
                                                <div class="search-box input-group">
                                                    
                                                    <button type="button" class="btn btn-secondary btn-lg"><i class="fa fa-barcode"></i></button>
                                                    <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <div class="table-responsive mt-3">
                                                    <table id="myTable" class="table table-hover order-list">
                                                        <thead>
                                                            <tr>
                                                                <th>{{trans('file.name')}}</th>
                                                                <th>{{trans('file.Code')}}</th>
                                                                <th>{{trans('file.Quantity')}}</th>
                                                                <th><i class="dripicons-trash"></i></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-2">
                                            <strong>{{trans('file.Print')}}: </strong>&nbsp;
                                            <strong><input type="checkbox" name="name" checked /> {{trans('file.Product Name')}}</strong>&nbsp;
                                            <strong><input type="checkbox" name="price" checked/> {{trans('file.Price')}}</strong>&nbsp;
                                            <strong><input type="checkbox" name="promo_price"/> {{trans('file.Promotional Price')}}</strong>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label><strong>Paper Size *</strong></label>
                                                <select class="form-control" name="paper_size" required id="paper-size">
                                                    <option value="0">Select paper size...</option>
                                                    <option value="36">36 mm (1.4 inch)</option>
                                                    <option value="24">24 mm (0.94 inch)</option>
                                                    <option value="18">18 mm (0.7 inch)</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3">
                                            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary" id="submit-button">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="print-barcode" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                          <h5 id="modal_header" class="modal-title">{{trans('file.Barcode')}}</h5>&nbsp;&nbsp;
                          <button id="print-btn" type="button" class="btn btn-default btn-sm"><i class="dripicons-print"></i> {{trans('file.Print')}}</button>
                          <button type="button" id="close-btn" data-bs-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="modal-body">
                            <div id="label-content">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
@endsection @section('scripts')
<script type="text/javascript" src="https://js.stripe.com/v3/"></script>

@endsection

@push('after-scripts')
 
<script type="text/javascript" src="<?php echo asset('vendor/jquery/jquery.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/jquery/jquery-ui.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/jquery/bootstrap-datepicker.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/jquery/jquery.timepicker.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/popper.js/umd/popper.min.js') ?>">
  </script>
  <script type="text/javascript" src="<?php echo asset('vendor/bootstrap/js/bootstrap.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/bootstrap-toggle/js/bootstrap-toggle.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/bootstrap/js/bootstrap-select.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/keyboard/js/jquery.keyboard.js') ?>"></script>
  
  
  
  <script type="text/javascript" src="<?php echo asset('vendor/keyboard/js/jquery.keyboard.extension-autocomplete.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('js/grasp_mobile_progress_circle-1.0.0.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/jquery.cookie/jquery.cookie.js') ?>">
  </script>
  <script type="text/javascript" src="<?php echo asset('vendor/chart.js/Chart.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/jquery-validation/jquery.validate.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('js/charts-custom.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('js/front.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/daterange/js/moment.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/daterange/js/knockout-3.4.2.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/daterange/js/daterangepicker.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/tinymce/js/tinymce/tinymce.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('js/dropzone.js') ?>"></script>

  <!-- table sorter js-->
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/pdfmake.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/vfs_fonts.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/jquery.dataTables.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/dataTables.bootstrap4.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/dataTables.buttons.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/buttons.bootstrap4.min.js') ?>">
  </script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/buttons.colVis.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/buttons.html5.min.js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/buttons.print.min.js') ?>"></script>

  <script type="text/javascript" src="<?php echo asset('vendor/datatable/sum().js') ?>"></script>
  <script type="text/javascript" src="<?php echo asset('vendor/datatable/dataTables.checkboxes.min.js') ?>"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
  <!-- Custom stylesheet - for your changes-->

   
<script type="text/javascript">

    $("ul#product").siblings('a').attr('aria-expanded','true');
    $("ul#product").addClass("show");
    $("ul#product #printBarcode-menu").addClass("active");
    <?php $productArray = []; ?>
    var lims_product_code = [
    @foreach($lims_product_list_without_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->ItemCode . ' (' . $product->ItemName . ')');
        ?>
    @endforeach
    @foreach($lims_product_list_with_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->ItemCode . ' (' . $product->ItemName . ')');
        ?>
    @endforeach
    <?php
        echo  '"'.implode('","', $productArray).'"';
    ?> 
    ];

    var lims_productcodeSearch = $('#lims_productcodeSearch');

    lims_productcodeSearch.autocomplete({
    source: function(request, response) {
        var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
        response($.grep(lims_product_code, function(item) {
            return matcher.test(item);
        }));
    },
    select: function(event, ui) {
        var data = ui.item.value;
        $.ajax({
            type: 'GET',
            url: 'products/lims_product_search',
            data: {
                data: data
            },
            success: function(data) {
                var flag = 1;
                $(".product-code").each(function() {
                    if ($(this).text() == data[1]) {
                        alert('duplicate input is not allowed!')
                        flag = 0;
                    }
                });
                $("input[name='product_code_name']").val('');
                if(flag){
                    console.log(data[3]);
                    var newRow = $('<tr data-imagedata="'+data[3]+'" data-price="'+data[2]+'" data-promo-price="'+data[4]+'" data-currency="'+data[5]+'" data-currency-position="'+data[6]+'">');
                    var cols = '';
                    cols += '<td>' + data[0] + '</td>';
                    cols += '<td class="product-code">' + data[1] + '</td>';
                    cols += '<td><input type="number" class="form-control qty" name="qty[]" value="1" /></td>';
                    cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger">Delete</button></td>';

                    newRow.append(cols);
                    $("table.order-list tbody").append(newRow);
                }
            }
        });
    }
});

    //Delete product
    $("table.order-list tbody").on("click", ".ibtnDel", function(event) {
        rowindex = $(this).closest('tr').index();
        $(this).closest("tr").remove();
    });

    $("#submit-button").on("click", function(event) {
        paper_size = ($("#paper-size").val());
        if(paper_size != "0") {
            var product_name = [];
            var code = [];
            var price = [];
            var promo_price = [];
            var qty = [];
            var barcode_image = [];
            var currency = [];
            var currency_position = [];
            var rownumber = $('table.order-list tbody tr:last').index();
            for(i = 0; i <= rownumber; i++){
                product_name.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('td:nth-child(1)').text());
                code.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('td:nth-child(2)').text());
                price.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('price'));
                promo_price.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('promo-price'));
                currency.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('currency'));
                currency_position.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('currency-position'));
                qty.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').find('.qty').val());
                barcode_image.push($('table.order-list tbody tr:nth-child(' + (i + 1) + ')').data('imagedata'));
            }
            var htmltext = '<table class="barcodelist" style="width:378px;" cellpadding="5px" cellspacing="10px">';
            $.each(qty, function(index){
                i = 0;
                while(i < qty[index]){
                    if(i % 2 == 0)
                        htmltext +='<tr>';
                    htmltext +='<td style="width:164px;height:88%;padding-top:7px;vertical-align:middle;text-align:center">';
                    htmltext += product_name[index] + '<br>';
                    htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';
                    htmltext += '<strong>'+code[index]+'</strong><br>';
                    htmltext += 'price: '+price[index];
                    htmltext +='</td>';
                    if(i % 2 != 0)
                        htmltext +='</tr>';
                    i++;
                }
            });
            $.each(qty, function(index){
                i = 0;
                while(i < qty[index]) {
                    if(i % 2 == 0)
                        htmltext +='<tr>';
                    // 36mm
                    if(paper_size == 36)
                        htmltext +='<td style="width:164px;height:88%;padding-top:7px;vertical-align:middle;text-align:center">';
                    //24mm
                    else if(paper_size == 24)
                        htmltext +='<td style="width:164px;height:100%;font-size:12px;text-align:center">';
                    //18mm
                    else if(paper_size == 18)
                        htmltext +='<td style="width:164px;height:100%;font-size:10px;text-align:center">';

                    if($('input[name="name"]').is(":checked"))
                        htmltext += product_name[index] + '<br>';

                    if(paper_size == 18)
                        htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';
                    else
                        htmltext += '<img style="max-width:150px;" src="data:image/png;base64,'+barcode_image[index]+'" alt="barcode" /><br>';

                    htmltext += code[index] + '<br>';
                    if($('input[name="code"]').is(":checked"))
                        htmltext += '<strong>'+code[index]+'</strong><br>';
                    if($('input[name="promo_price"]').is(":checked")) {
                        if(currency_position[index] == 'prefix')
                            htmltext += 'Price: '+currency[index]+'<span style="text-decoration: line-through;"> '+price[index]+'</span> '+promo_price[index]+'<br>';
                        else
                            htmltext += 'Price: <span style="text-decoration: line-through;">'+price[index]+'</span> '+promo_price[index]+' '+currency[index]+'<br>';
                    }
                    else if($('input[name="price"]').is(":checked")) {
                        if(currency_position[index] == 'prefix')
                            htmltext += 'Price: '+currency[index]+' '+price[index];
                        else
                            htmltext += 'Price: '+price[index]+' '+currency[index];
                    }
                    htmltext +='</td>';
                    if(i % 2 != 0)
                        htmltext +='</tr>';
                    i++;
                }
            });
            htmltext += '</table">';
            $('#label-content').html(htmltext);
            $('#print-barcode').modal('show');
        }
        else
            alert('Please select paper size');
    });

    /*$("#print-btn").on("click", function(){
          var divToPrint=document.getElementById('print-barcode');
          var newWin=window.open('','Print-Window');
          newWin.document.open();
          newWin.document.write('<style type="text/css">@media print { #modal_header { display: none } #print-btn { display: none } #close-btn { display: none } } table.barcodelist { page-break-inside:auto } table.barcodelist tr { page-break-inside:avoid; page-break-after:auto }</style><body onload="window.print()">'+divToPrint.innerHTML+'</body>');
          newWin.document.close();
          setTimeout(function(){newWin.close();},10);
    });*/

    $("#print-btn").on("click", function() {
          var divToPrint=document.getElementById('print-barcode');
          var newWin=window.open('','Print-Window');
          newWin.document.open();
          newWin.document.write('<style type="text/css">@media print { #modal_header { display: none } #print-btn { display: none } #close-btn { display: none } } table.barcodelist { page-break-inside:auto } table.barcodelist tr { page-break-inside:avoid; page-break-after:auto }</style><body onload="window.print()">'+divToPrint.innerHTML+'</body>');
          newWin.document.close();
          setTimeout(function(){newWin.close();},10);
    });

</script>

@endpush