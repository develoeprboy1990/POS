<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Yajra\DataTables\DataTables;
use Illuminate\Validation\Rule;
use App\Models\Category;
use App\Models\Product;
use App\Models\Item;
use App\Models\ProductVariant;
use App\Models\ProductBatch;
use App\Models\Customer;
use App\Models\CustomerGroup;
use App\Models\Sale;
use App\Models\Warehouse;
use App\Models\PosSetting;
use App\Models\Biller;
use App\Models\Brand;
use App\Models\Unit;
use App\Models\Coupon;
use App\Models\Tax;
use App\Models\Product_Warehouse;
use App\Models\Product_Sale;
use App\Models\Payment;
/* use Keygen\Keygen;
use DNS1D;
use DNS2D; */

class TeqPosController extends Controller
{
    public function createTeqInvoice()
    {
        $lims_customer_list      = DB::table('party')->where('Active', 'Yes')->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_warehouse_list     = Warehouse::where('is_active', true)->get();
        $lims_biller_list        = Biller::where('is_active', true)->get();
        $lims_tax_list           = Tax::where('is_active', true)->get();
        $lims_product_list       = Product::select('id', 'name', 'code', 'image')->ActiveFeatured()->whereNull('is_variant')->get();
        $lims_product_list       = DB::table('item')->selectRaw('ItemID AS id,ItemName as name,ItemCode AS code,ItemImage AS image')->get();

        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }
        $lims_product_list_with_variant = Product::select('id', 'name', 'code', 'image')->ActiveFeatured()->whereNotNull('is_variant')->get();


        foreach ($lims_product_list_with_variant as $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
            $lims_product_variant_data = $product->variant()->orderBy('position')->get();
            $main_name = $product->name;
            $temp_arr = [];
            foreach ($lims_product_variant_data as $key => $variant) {
                $product->name = $main_name . ' [' . $variant->name . ']';
                $product->code = $variant->pivot['item_code'];
                $lims_product_list[] = clone ($product);
            }
        }
        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_brand_list = Brand::where('is_active', true)->get();
        $lims_category_list = DB::table('item_category')->get();

        // if(Auth::user()->role_id > 2 && config('staff_access') == 'own') {
        //     $recent_sale = Sale::where([
        //         ['sale_status', 1],
        //         ['user_id', Auth::id()]
        //     ])->orderBy('id', 'desc')->take(10)->get();
        //     $recent_draft = Sale::where([
        //         ['sale_status', 3],
        //         ['user_id', Auth::id()]
        //     ])->orderBy('id', 'desc')->take(10)->get();
        // }
        // else {
        // else {
        $recent_sale = Sale::where('sale_status', 1)->orderBy('id', 'desc')->take(10)->get();
        $recent_draft = Sale::where('sale_status', 3)->orderBy('id', 'desc')->take(10)->get();
        // }
        $lims_coupon_list = Coupon::where('is_active', true)->get();
        $flag = 0;
        return view('teq-invoice.new_teq_invoice', compact('lims_customer_list', 'lims_customer_group_all', 'lims_warehouse_list', 'lims_product_list', 'product_number', 'lims_tax_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'recent_sale', 'recent_draft', 'lims_coupon_list', 'flag'));
    }

    public function storeInvoice(Request $request)
    {
        $data = $request->all();
     
        if (isset($request->reference_no)) {
            $this->validate($request, [
                'ReferenceNo' => [
                    'max:191', 'required', 'unique:sales'
                ],
            ]);
        }
        //return dd($data);
        $data['user_id'] = session::get('UserID');

        // $cash_register_data = CashRegister::where([
        //     ['user_id', $data['user_id']],
        //     ['warehouse_id', $data['warehouse_id']],
        //     ['status', true]
        // ])->first();

        // if($cash_register_data)
        //     $data['cash_register_id'] = $cash_register_data->id;

        if ($data['pos']) {
            if (!isset($data['reference_no']))
                $data['reference_no'] = date("his");

            $balance = $data['grand_total'] - $data['paid_amount'];
            if ($balance > 0 || $balance < 0)
                $data['payment_status'] = 2;
            else
                $data['payment_status'] = 4;


            if ($data['draft']) {
                $lims_sale_data = Sale::find($data['sale_id']);
                $lims_product_sale_data = Product_Sale::where('sale_id', $data['sale_id'])->get();
                foreach ($lims_product_sale_data as $product_sale_data) {
                    $product_sale_data->delete();
                }
                $lims_sale_data->delete();
            }
        } else {
            if (!isset($data['reference_no']))
                $data['reference_no'] = date("his");
        }

        $document = $request->document;
        if ($document) {
            $v = Validator::make(
                [
                    'extension' => strtolower($request->document->getClientOriginalExtension()),
                ],
                [
                    'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                ]
            );
            if ($v->fails())
                return redirect()->back()->withErrors($v->errors());

            $documentName = $document->getClientOriginalName();
            $document->move('public/sale/documents', $documentName);
            $data['document'] = $documentName;
        }
        if ($data['coupon_active']) {
            $lims_coupon_data = Coupon::find($data['coupon_id']);
            $lims_coupon_data->used += 1;
            $lims_coupon_data->save();
        }

        // dd($data);
        $today_date = date('Y-m-d');
        if (!empty($request->invoice_date))
            $today_date = $request->invoice_date;

        // $lims_sale_data = Sale::create($data);
        $invoice_no = DB::table('invoice_master')->latest('InvoiceMasterID')->pluck('InvoiceMasterID')->first();
        $invoice_no = 'POS-0000' . ++$invoice_no;
        $lims_customer_data = DB::table('party')->where('PartyID', $data['customer_id'])->first();
        $remaining_balance = $request->paying_amount -  $request->paid_amount;

        $paying_method = match ($data['paid_by_id']) {
            '1' => 'Cash',
            '2' => 'Gift Card',
            '3' => 'Credit Card',
            '4' => 'Cheque',
            '5' => 'Paypal',
            default => 'Deposit'
        }; 
        
        $invoice_data = array(
            "InvoiceNo"          => $invoice_no,
            "ReferenceNo"        => $data['reference_no'],
            "Date"               => $today_date,  // focus
            "DueDate"            => $today_date, // focus
            "PartyID"            => $request->customer_id,
            "WarehouseID"        => $request->warehouse_id,
            "WalkinCustomerName" => $lims_customer_data->PartyName,
            "SupplierID"         => $request->biller_id,
            "UserID"             => session::get('UserID'),
            "DescriptionNotes"   => $request->sale_note, // focus
            "CustomerNotes"      => $request->sale_note, // focus
            "Tax"                => $request->order_tax,
            "TaxPer"             => $request->order_tax_rate,
            "Paid"               => $request->paid_amount,
            "Balance"            => $remaining_balance,
            "TotalQty"           => $request->total_qty,
            "SubTotal"           => $request->total_price,
            "PaymentMode"        => $paying_method, // focus
            "DiscountModel"      => $request->discount_model,
            "DiscountPer"        => round($request->DiscountPer,2),
            "DiscountAmount"     => $request->order_discount,
            "Shipping"           => $request->shipping_cost,
            "GrandTotal"         => $request->grand_total,            
            "Total"         => $request->total,
            
        );

        $lims_sale_data = DB::table('invoice_master')->insertGetId($invoice_data);

        //collecting mail data
        /*
        $mail_data['email'] = $lims_customer_data->Email;
        $mail_data['reference_no'] = $lims_sale_data->ReferenceNo;
        $mail_data['sale_status'] = $lims_sale_data->sale_status;
        $mail_data['payment_status'] = $lims_sale_data->payment_status;
        $mail_data['total_qty'] = $lims_sale_data->total_qty;
        $mail_data['total_price'] = $lims_sale_data->total_price;
        $mail_data['order_tax'] = $lims_sale_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
        $mail_data['order_discount'] = $lims_sale_data->order_discount;
        $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
        $mail_data['grand_total'] = $lims_sale_data->grand_total;
        $mail_data['paid_amount'] = $lims_sale_data->paid_amount;
        */

        $product_quantities = $data['qty'];
        $product_prices = $data['net_unit_price'];
        $product_taxes = $data['tax']; // focus
        $product_discounts = $data['discount'];
        $product_taxa = $data['tax_rate']; // focus
        $product_disca = $data['discount']; //focus
        $product_subtotals = $data['subtotal'];
        $product_pids = $data['product_id'];
        $product_units = $data['sale_unit'];
        $product_hsns = $request->hsn;
        $product_serials = $request->serial;

        /* Payment Save */
        $data['amount']          = $data['paid_amount'];
        $data['InvoiceMasterID'] = $lims_sale_data;
        $data['paying_method']   = $paying_method;
        $this->payment($data);
        /* Payment Save Ends here. */

        foreach ($product_pids as $key => $pid) {
            $item_name = DB::table('item')->where('ItemID', $pid)->pluck('ItemName')->first();
            $prod_qty = $product_quantities[$key];
            $invoice_detail = array(
                "InvoiceMasterID" => $lims_sale_data,
                "InvoiceNo" => $invoice_no,
                "ItemID" => $pid,
                "Description" => $item_name,
                "PartyID" => $request->customer_id,
                "SupplierID" => $request->biller_id,
                "Qty" => $prod_qty,
                "Rate" => $product_prices[$key],
                "TaxPer" => floatval(preg_replace('/[^\d.]/', '', $product_taxa[$key])),
                "Tax" => $product_taxes[$key],
                "Total" => floatval(preg_replace('/[^\d.]/', '', $product_subtotals[$key])),
            );

            $insert_detail = DB::table('invoice_detail')->insert($invoice_detail);

            $child_warehouse_data = Product_Warehouse::where([
                ['product_id', $pid],
                ['warehouse_id', $data['warehouse_id']],
            ])->first();
            $new_qty = $child_warehouse_data->qty - $prod_qty;
            $child_warehouse_data->qty = $new_qty;
            $child_warehouse_data->save();
        }

        /* saving items */

        // foreach ($product_id as $i => $id) {
        //     $lims_product_data = Product::where('id', $id)->first();
        //     $product_sale['variant_id'] = null;
        //     $product_sale['product_batch_id'] = null;
        //     if($lims_product_data->type == 'combo' && $data['sale_status'] == 1){
        //         $product_list = explode(",", $lims_product_data->product_list);
        //         $qty_list = explode(",", $lims_product_data->qty_list);
        //         $price_list = explode(",", $lims_product_data->price_list);

        //         foreach ($product_list as $key=>$child_id) {
        //             $child_data = Product::find($child_id);
        //             $child_warehouse_data = Product_Warehouse::where([
        //                 ['product_id', $child_id],
        //                 ['warehouse_id', $data['warehouse_id'] ],
        //                 ])->first();

        //             $child_data->qty -= $qty[$i] * $qty_list[$key];
        //             $child_warehouse_data->qty -= $qty[$i] * $qty_list[$key];

        //             $child_data->save();
        //             $child_warehouse_data->save();
        //         }
        //     }

        //     if($sale_unit[$i] != 'n/a') {
        //         $lims_sale_unit_data  = Unit::where('unit_name', $sale_unit[$i])->first();
        //         $sale_unit_id = $lims_sale_unit_data->id;
        //         if($lims_product_data->is_variant) {
        //             $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($id, $product_code[$i])->first();
        //             $product_sale['variant_id'] = $lims_product_variant_data->variant_id;
        //         }

        //         if($data['sale_status'] == 1) {
        //             if($lims_sale_unit_data->operator == '*')
        //                 $quantity = $qty[$i] * $lims_sale_unit_data->operation_value;
        //             elseif($lims_sale_unit_data->operator == '/')
        //                 $quantity = $qty[$i] / $lims_sale_unit_data->operation_value;
        //             //deduct quantity
        //             $lims_product_data->qty = $lims_product_data->qty - $quantity;
        //             $lims_product_data->save();
        //             //deduct product variant quantity if exist
        //             if($lims_product_data->is_variant) {
        //                 $lims_product_variant_data->qty -= $quantity;
        //                 $lims_product_variant_data->save();
        //                 $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
        //             }
        //             elseif($product_batch_id[$i]) {
        //                 $lims_product_warehouse_data = Product_Warehouse::where([
        //                     ['product_batch_id', $product_batch_id[$i] ],
        //                     ['warehouse_id', $data['warehouse_id'] ]
        //                 ])->first();
        //                 $lims_product_batch_data = ProductBatch::find($product_batch_id[$i]);
        //                 $product_sale['product_batch_id'] = $lims_product_batch_data->id;
        //                 //deduct product batch quantity
        //                 $lims_product_batch_data->qty -= $quantity;
        //                 $lims_product_batch_data->save();
        //             }
        //             else {
        //                 $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($id, $data['warehouse_id'])->first();
        //             }
        //             //deduct quantity from warehouse
        //             $lims_product_warehouse_data->qty -= $quantity;
        //             $lims_product_warehouse_data->save();
        //         }
        //     }
        //     else
        //         $sale_unit_id = 0;
        //     if($product_sale['variant_id']){
        //         $variant_data = Variant::select('name')->find($product_sale['variant_id']);
        //         $mail_data['products'][$i] = $lims_product_data->name . ' ['. $variant_data->name .']';
        //     }
        //     else
        //         $mail_data['products'][$i] = $lims_product_data->name;
        //     if($lims_product_data->type == 'digital')
        //         $mail_data['file'][$i] = url('/public/product/files').'/'.$lims_product_data->file;
        //     else
        //         $mail_data['file'][$i] = '';
        //     if($sale_unit_id)
        //         $mail_data['unit'][$i] = $lims_sale_unit_data->unit_code;
        //     else
        //         $mail_data['unit'][$i] = '';

        //     $product_sale['sale_id'] = $lims_sale_data->id ;
        //     $product_sale['product_id'] = $id;
        //     $product_sale['qty'] = $mail_data['qty'][$i] = $qty[$i];
        //     $product_sale['sale_unit_id'] = $sale_unit_id;
        //     $product_sale['net_unit_price'] = $net_unit_price[$i];
        //     $product_sale['discount'] = $discount[$i];
        //     $product_sale['tax_rate'] = $tax_rate[$i];
        //     $product_sale['tax'] = $tax[$i];
        //     $product_sale['total'] = $mail_data['total'][$i] = $total[$i];
        //     Product_Sale::create($product_sale);
        // }

        /* End saving items */

        if ($data['sale_status'] == 3)
            $message = 'Sale successfully added to draft';
        else
            $message = ' Sale created successfully';

        /* Sending Email */

        // if($mail_data['email'] && $data['sale_status'] == 1) {
        //     try {
        //         Mail::send( 'mail.sale_details', $mail_data, function( $message ) use ($mail_data)
        //         {
        //             $message->to( $mail_data['email'] )->subject( 'Sale Details' );
        //         });
        //     }
        //     catch(\Exception $e){
        //         $message = ' Sale created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        //     }
        // }

        /* End Sending Email */


        /* checking Payment type and updating tables */

        // if($data['payment_status'] == 3 || $data['payment_status'] == 4 || ($data['payment_status'] == 2 && $data['pos'] && $data['paid_amount'] > 0)) {

        //     if($data['paid_by_id'] == 1)
        //         $paying_method = 'Cash';
        //     elseif ($data['paid_by_id'] == 2){
        //         $paying_method = 'Gift Card';
        //     }
        //     elseif ($data['paid_by_id'] == 3)
        //         $paying_method = 'Credit Card';
        //     elseif ($data['paid_by_id'] == 4)
        //         $paying_method = 'Cheque';
        //     elseif ($data['paid_by_id'] == 5)
        //         $paying_method = 'Paypal';
        //     else
        //         $paying_method = 'Deposit';

        //     $lims_payment_data = new Payment();
        //     $lims_payment_data->user_id = Auth::id();
        //     if($cash_register_data)
        //         $lims_payment_data->cash_register_id = $cash_register_data->id;
        //     $lims_account_data = Account::where('is_default', true)->first();
        //     $lims_payment_data->account_id = $lims_account_data->id;
        //     $lims_payment_data->sale_id = $lims_sale_data->id;
        //     $data['payment_reference'] = 'spr-'.date("Ymd").'-'.date("his");
        //     $lims_payment_data->payment_reference = $data['payment_reference'];
        //     $lims_payment_data->amount = $data['paid_amount'];
        //     $lims_payment_data->change = $data['paying_amount'] - $data['paid_amount'];
        //     $lims_payment_data->paying_method = $paying_method;
        //     $lims_payment_data->payment_note = $data['payment_note'];
        //     $lims_payment_data->save();

        //     $lims_payment_data = Payment::latest()->first();
        //     $data['payment_id'] = $lims_payment_data->id;
        //     if($paying_method == 'Credit Card'){
        //         $lims_pos_setting_data = PosSetting::latest()->first();
        //         Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
        //         $token = $data['stripeToken'];
        //         $grand_total = $data['grand_total'];

        //         $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $data['customer_id'])->first();

        //         if(!$lims_payment_with_credit_card_data) {
        //             // Create a Customer:
        //             $customer = \Stripe\Customer::create([
        //                 'source' => $token
        //             ]);

        //             // Charge the Customer instead of the card:
        //             $charge = \Stripe\Charge::create([
        //                 'amount' => $grand_total * 100,
        //                 'currency' => 'usd',
        //                 'customer' => $customer->id
        //             ]);
        //             $data['customer_stripe_id'] = $customer->id;
        //         }
        //         else {
        //             $customer_id = 
        //             $lims_payment_with_credit_card_data->customer_stripe_id;

        //             $charge = \Stripe\Charge::create([
        //                 'amount' => $grand_total * 100,
        //                 'currency' => 'usd',
        //                 'customer' => $customer_id, // Previously stored, then retrieved
        //             ]);
        //             $data['customer_stripe_id'] = $customer_id;
        //         }
        //         $data['charge_id'] = $charge->id;
        //         PaymentWithCreditCard::create($data);
        //     }
        //     elseif ($paying_method == 'Gift Card') {
        //         $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
        //         $lims_gift_card_data->expense += $data['paid_amount'];
        //         $lims_gift_card_data->save();
        //         PaymentWithGiftCard::create($data);
        //     }
        //     elseif ($paying_method == 'Cheque') {
        //         PaymentWithCheque::create($data);
        //     }
        //     elseif ($paying_method == 'Paypal') {
        //         $provider = new ExpressCheckout;
        //         $paypal_data = [];
        //         $paypal_data['items'] = [];
        //         foreach ($data['product_id'] as $key => $product_id) {
        //             $lims_product_data = Product::find($product_id);
        //             $paypal_data['items'][] = [
        //                 'name' => $lims_product_data->name,
        //                 'price' => ($data['subtotal'][$key]/$data['qty'][$key]),
        //                 'qty' => $data['qty'][$key]
        //             ];
        //         }
        //         $paypal_data['items'][] = [
        //             'name' => 'Order Tax',
        //             'price' => $data['order_tax'],
        //             'qty' => 1
        //         ];
        //         $paypal_data['items'][] = [
        //             'name' => 'Order Discount',
        //             'price' => $data['order_discount'] * (-1),
        //             'qty' => 1
        //         ];
        //         $paypal_data['items'][] = [
        //             'name' => 'Shipping Cost',
        //             'price' => $data['shipping_cost'],
        //             'qty' => 1
        //         ];
        //         if($data['grand_total'] != $data['paid_amount']){
        //             $paypal_data['items'][] = [
        //                 'name' => 'Due',
        //                 'price' => ($data['grand_total'] - $data['paid_amount']) * (-1),
        //                 'qty' => 1
        //             ];
        //         }
        //         //return $paypal_data;
        //         $paypal_data['invoice_id'] = $lims_sale_data->reference_no;
        //         $paypal_data['invoice_description'] = "Reference # {$paypal_data['invoice_id']} Invoice";
        //         $paypal_data['return_url'] = url('/sale/paypalSuccess');
        //         $paypal_data['cancel_url'] = url('/sale/create');

        //         $total = 0;
        //         foreach($paypal_data['items'] as $item) {
        //             $total += $item['price']*$item['qty'];
        //         }

        //         $paypal_data['total'] = $total;
        //         $response = $provider->setExpressCheckout($paypal_data);
        //          // This will redirect user to PayPal
        //         return redirect($response['paypal_link']);
        //     }
        //     elseif($paying_method == 'Deposit'){
        //         $lims_customer_data = Customer::find($data['customer_id']);
        //         $lims_customer_data->expense += $data['paid_amount'];
        //         $lims_customer_data->save();
        //     }
        // }

        /* End checking Payment type and updating tables */



        // return redirect('sales/gen_invoice/' . $lims_sale_data->id)->with('message', $message);
        if ($data['sale_status'] == '1' && $data['print_status'] == '1')
            return redirect(route('invoice.print', ['id' => $lims_sale_data]))->with('message', $message);
        elseif($data['sale_status'] == '1' && $data['print_status'] == '0')
            return redirect(route('invoice.create'))->with('message', $message);
        else
            return redirect()->back()->with('message', $message);
    }




    public function edit($InvoiceMasterID)
    {
        // $lims_customer_list     = Customer::where('is_active', true)->get();
        // $lims_warehouse_list    = Warehouse::where('is_active', true)->get();
        // $lims_biller_list       = Biller::where('is_active', true)->get();
        // $lims_tax_list          = Tax::where('is_active', true)->get();
        // $lims_sale_data         = Sale::find($InvoiceMasterID);


        // $lims_product_sale_data = Product_Sale::where('sale_id', $InvoiceMasterID)->get();

        // $invoice_master = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();

        // $invoice_detail = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->get();

        // $items          = DB::table('item')->get();
        // $categories     = DB::table('item_category')->get();
        // $salemans       = DB::table('salesman')->pluck('name', 'SalesmanID')->toArray();
        // $parties        = DB::table('party')->get();
        // $customer_name = DB::table('party')->where('PartyID', $invoice_master->PartyID)->pluck('PartyName')->first();
        // $discount = 0;

        // return view('teq-invoice.edit_teq_invoice', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data','items', 'categories', 'salemans', 'invoice_detail', 'InvoiceMasterID', 'invoice_master', 'parties', 'discount', 'customer_name'));

        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();

        $lims_product_sale_data = DB::table('invoice_detail')->where('InvoiceMasterID', $InvoiceMasterID)->get();
        return view('teq-invoice.edit_teq_invoice', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data'));
    }



    public function update(Request $request, $id)
    {
        $data = $request->all();

        $remaining_balance = $data['grand_total'] - $data['paid_amount'];
        $invoice_master = DB::table('invoice_master')->where('InvoiceMasterID', $id)->first();
        $today_date = date('Y-m-d');
        if (!empty($request->invoice_date))
            $today_date = $request->invoice_date;

        $lims_customer_data = DB::table('party')->where('PartyID', $data['customer_id'])->first();
        $discountAmount = $request->total_discount + $request->order_discount;
        $invoice_data = array(
            "Date"               => $today_date,  // focus
            "DueDate"            => $today_date, // focus
            "PartyID"            => $request->customer_id,
            "WalkinCustomerName" => $lims_customer_data->PartyName,
            "SupplierID"         => $request->biller_id,
            "UserID"             => session::get('UserID'),
            "DescriptionNotes"   => $request->sale_note, // focus
            "CustomerNotes"      => $request->sale_note, // focus
            "Tax"                => $request->total_tax,
            "Paid"               => $request->paid_amount,
            "Balance"            => $remaining_balance,
            "TotalQty"           => $request->total_qty,
            "SubTotal"           => $request->total_price,
            "DiscountAmount"     => $discountAmount,
            "Shipping"           => $request->shipping_cost,
            "GrandTotal"         => $request->grand_total,
        );

        $invoice_detail = DB::table('invoice_detail')->where('InvoiceMasterID', $id)->delete();
        $lims_sale_data = DB::table('invoice_master')->where('InvoiceMasterID', $id)->update($invoice_data);

        $product_quantities = $data['qty'];
        $product_prices     = $data['net_unit_price'];
        $product_taxes      = $data['tax']; // focus
        $product_discounts  = $data['discount'];
        $product_taxa       = $data['tax_rate']; // focus
        $product_disca      = $data['discount']; //focus
        $product_subtotals  = $data['subtotal'];
        $product_pids       = $data['product_id'];
        $product_units      = $data['sale_unit'];
        $product_hsns       = $request->hsn;
        $product_serials    = $request->serial;
        $data['InvoiceMasterID'] = $id;

        /*  $paying_amount  = $data['paying_amount'];
        $amount         = $data['amount'];
        $payment_note   = $data['payment_note'];

        $this->payment($data); */

        foreach ($product_pids as $key => $pid) {
            $item_name = DB::table('item')->where('ItemID', $pid)->pluck('ItemName')->first();
            $prod_qty = $product_quantities[$key];
            $invoice_detail = array(
                "InvoiceMasterID" => $invoice_master->InvoiceMasterID,
                "InvoiceNo" => $invoice_master->InvoiceNo,
                "ItemID" => $pid,
                "Description" => $item_name,
                "PartyID" => $request->customer_id,
                "SupplierID" => $request->biller_id,
                "Qty" => $prod_qty,
                "Rate" => $product_prices[$key],
                "TaxPer" => floatval(preg_replace('/[^\d.]/', '', $product_taxa[$key])),
                "Tax" => $product_taxes[$key],
                "Total" => floatval(preg_replace('/[^\d.]/', '', $product_subtotals[$key])),
            );

            $insert_detail = DB::table('invoice_detail')->insert($invoice_detail);

            $child_warehouse_data = Product_Warehouse::where([
                ['product_id', $pid],
                ['warehouse_id', $data['warehouse_id']],
            ])->first();
            if ($child_warehouse_data) {
                $new_qty = $child_warehouse_data->qty - $prod_qty;
                $child_warehouse_data->qty = $new_qty;
                $child_warehouse_data->save();
            }
        }


        if ($data['sale_status'] == 3)
            $message = 'Sale successfully added to draft';
        else
            $message = ' Invoice Updated successfully';



        if ($data['sale_status'] == '1')
            // return redirect(route('invoice.print', ['id' => $lims_sale_data]))->with('message', $message);
            return redirect()->back()->with('message', $message);
        else
            return redirect()->back()->with('message', $message);
    }

    public function addPayment(Request $request)
    {
        $data = $request->all();
        if (!empty($data['amount']) && $data['amount'] > 0) {


            $paying_method = match ($data['paid_by_id']) {
                '1' => 'Cash',
                '2' => 'Gift Card',
                '3' => 'Credit Card',
                '4' => 'Cheque',
                '5' => 'Paypal',
                default => 'Deposit'
            };
            $data['paying_method'] = $paying_method;
            $this->payment($data, true);
            $message = 'Payment created successfully';
            return redirect()->back()->with('message', $message);
        } else {
            return redirect()->back()->with('message', 'No payment paid.');
        }
    }

    protected function payment($data, $updateInvoice = false)
    {
        $paying_amount  = $data['paying_amount'];
        $amount         = $data['amount'];
        $payment_note   = $data['payment_note'];
        $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
        if ($updateInvoice) {
            $lims_sale_data = DB::table('invoice_master')->where('InvoiceMasterID', $data['InvoiceMasterID'])->first();
            $paid           = $lims_sale_data->Paid + $amount;
            $grandTotal     = $lims_sale_data->GrandTotal;
            DB::table('invoice_master')->where('InvoiceMasterID', $data['InvoiceMasterID'])->update([
                'Balance' => $grandTotal - $paid,
                'Paid' => $paid
            ]);
        }

        $UserID  = session::get('UserID');
        $payment = Payment::create([
            "PaymentReference" => $data['payment_reference'],
            "InvoiceMasterID"  => $data['InvoiceMasterID'],
            "PartyID"          => 1,
            "UserID"           => $UserID,
            "Amount"           => $amount,
            "Change"           => $paying_amount - $amount,
            "PayingMethod"     => $data['paying_method'],
            "PaymentNote"      => $payment_note
        ]);
        return $payment;
    }


    public function limsProductSearch(Request $request)
    {
        $ItemCode = $request->get('data');
        $todayDate = date('Y-m-d');
        $product_code = explode("(", $ItemCode);
        $product_code[0] = rtrim($product_code[0], " ");
        $product_variant_id = null;
        $lims_product_data = Item::where([
            ['ItemCode', $product_code[0]]
        ])->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_price')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])->first();
            $product_variant_id = $lims_product_data->product_variant_id;
        }

        $product[] = $lims_product_data->ItemName;
        //if($lims_product_data->is_variant){
        if (0) {
            $product[] = $lims_product_data->item_code;
            $lims_product_data->price += $lims_product_data->additional_price;
        } else
            $product[] = $lims_product_data->ItemCode;

        // if($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date){
        if (0) {
            $product[] = $lims_product_data->promotion_price;
        } else
            $product[] = $lims_product_data->SellingPrice;

        //if($lims_product_data->tax_id) {
        if ($lims_product_data->Taxable == 'Yes') {
            /* $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[]     = $lims_tax_data->rate;
            $product[]     = $lims_tax_data->name;*/

            $product[]     = $lims_product_data->Percentage;
            $product[]     = 'unregistered ';
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = 1; // $lims_product_data->tax_method;
        //if($lims_product_data->type == 'standard'){
        if (1) {
            $units = Unit::where("base_unit", 1)
                ->orWhere('id', 1)
                ->get();
            $unit_name = array();
            $unit_operator = array();
            $unit_operation_value = array();
            foreach ($units as $unit) {
                if ($lims_product_data->sale_unit_id == $unit->id) {
                    array_unshift($unit_name, $unit->unit_name);
                    array_unshift($unit_operator, $unit->operator);
                    array_unshift($unit_operation_value, $unit->operation_value);
                } else {
                    $unit_name[]  = $unit->unit_name;
                    $unit_operator[] = $unit->operator;
                    $unit_operation_value[] = $unit->operation_value;
                }
            }
            $product[] = implode(",", $unit_name) . ',';
            $product[] = implode(",", $unit_operator) . ',';
            $product[] = implode(",", $unit_operation_value) . ',';
        } else {
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
        }
        $product[] = $lims_product_data->ItemID;
        $product[] = $product_variant_id;
        $product[] = null; //$lims_product_data->promotion;
        $product[] = null; //$lims_product_data->is_batch;
        return $product;
    }


    public function getProduct($id)
    {
        $lims_product_warehouse_data = Item::join('product_warehouse', 'item.ItemID', '=', 'product_warehouse.product_id')
            ->where([
                ['product_warehouse.warehouse_id', $id],
                ['product_warehouse.qty', '>', 0]
            ])
            ->whereNull('product_warehouse.variant_id')
            ->whereNull('product_warehouse.product_batch_id')
            ->select('product_warehouse.*', 'item.*')
            ->get();



        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode
        $lims_product_with_batch_warehouse_data = Product::join('product_warehouse', 'products.id', '=', 'product_warehouse.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouse.warehouse_id', $id],
                ['product_warehouse.qty', '>', 0]
            ])
            ->whereNull('product_warehouse.variant_id')
            ->whereNotNull('product_warehouse.product_batch_id')
            ->select('product_warehouse.*')
            ->groupBy('product_warehouse.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        \DB::reconnect();

        $lims_product_with_variant_warehouse_data = Product::join('product_warehouse', 'products.id', '=', 'product_warehouse.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouse.warehouse_id', $id],
                ['product_warehouse.qty', '>', 0]
            ])->whereNotNull('product_warehouse.variant_id')->select('product_warehouse.*')->get();

        $product_code  = [];
        $product_name  = [];
        $product_qty   = [];
        $product_price = [];
        $product_data  = [];
        //product without variant 
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[]     = $product_warehouse->qty;
            $product_price[]   = $product_warehouse->price;
            //$lims_product_data = Item::where('ItemID', $product_warehouse->product_id)->first();
            $product_code[]    =  $product_warehouse->ItemCode;
            $product_name[]    = htmlspecialchars($product_warehouse->ItemName);
            $product_type[]    = 'standard'; //$lims_product_data->type;
            $product_id[]      = $product_warehouse->ItemID;
            $product_list[]    = null; //$lims_product_data->product_list;
            $qty_list[]        = null; //$lims_product_data->qty_list;
            $batch_no[]        = null;
            $product_batch_id[] = null;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->price;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $product_code[] =  $lims_product_data->code;
            $product_name[] = htmlspecialchars($lims_product_data->name);
            $product_type[] = $lims_product_data->type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $product_batch_data = ProductBatch::select('id', 'batch_no')->find($product_warehouse->product_batch_id);
            $batch_no[] = $product_batch_data->batch_no;
            $product_batch_id[] = $product_batch_data->id;
        }
        //product with variant
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] =  $lims_product_variant_data->item_code;
            $product_name[] = htmlspecialchars($lims_product_data->name);
            $product_type[] = $lims_product_data->type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
        }
        //retrieve product with type of digital and combo
        $lims_product_data = Product::whereNotIn('type', ['standard'])->where('is_active', true)->get();
        foreach ($lims_product_data as $product) {
            $product_qty[] = $product->qty;
            $product_code[] =  $product->code;
            $product_name[] = $product->name;
            $product_type[] = $product->type;
            $product_id[] = $product->id;
            $product_list[] = $product->product_list;
            $qty_list[] = $product->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
        }
        $product_data = [$product_code, $product_name, $product_qty, $product_type, $product_id, $product_list, $qty_list, $product_price, $batch_no, $product_batch_id];
        return $product_data;
    }

    public function getCustomerGroup($id)
    {
        $customer_percentage = 0;
        return $customer_percentage;
        // $lims_customer_data = DB::table('party')->where('PartyID',$id);
        // $lims_customer_group_data = CustomerGroup::find($lims_customer_data->CustomerGroupID);
        // return $lims_customer_group_data->percentage;
    }

    public function checkAvailability($warehouse_id)
    {
        $open_register_number = 1;

        if ($open_register_number)
            return 'true';
        else
            return 'false';
    }



    public function getProductByFilter($category_id, $brand_id)
    {
        $data = [];
        if (($category_id != 0) && ($brand_id != 0)) {
            $lims_product_list = DB::table('item')
                ->join('item_category', 'item.ItemCategoryID', '=', 'item_category.ItemCategoryID')
                ->where([
                    ['item.IsActive', true],
                    ['item.ItemCategoryID', $category_id],
                    ['BrandID', $brand_id]
                ])->orWhere([
                    ['item_category.ParentID', $category_id],
                    ['item.IsActive', true],
                    ['BrandID', $brand_id]
                ])->select('item.ItemName', 'item.ItemCode', 'item.ItemImage')->get();
        } elseif (($category_id != 0) && ($brand_id == 0)) {
            $lims_product_list = DB::table('item')
                ->join('item_category', 'item.ItemCategoryID', '=', 'item_category.ItemCategoryID')
                ->where([
                    ['item.IsActive', true],
                    ['item.ItemCategoryID', $category_id],
                ])->orWhere([
                    ['item_category.ParentID', $category_id],
                    ['item.IsActive', true]
                ])->select('item.ItemID', 'item.ItemName', 'item.ItemCode', 'item.ItemImage')->get();
        } elseif (($category_id == 0) && ($brand_id != 0)) {
            $lims_product_list = DB::table('item')->where([
                ['BrandID', $brand_id],
                ['IsActive', true]
            ])
                ->select('item.ItemID', 'item.ItemName', 'item.ItemCode', 'item.ItemImage')
                ->get();
        } else
            $lims_product_list = DB::table('item')->where('IsActive', true)->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            // if ($product->is_variant) {
            //     $lims_product_data = Product::select('id')->find($product->id);
            //     $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
            //     foreach ($lims_product_variant_data as $key => $variant) {
            //         $data['name'][$index] = $product->name . ' [' . $variant->name . ']';
            //         $data['code'][$index] = $variant->pivot['item_code'];
            //         $images = explode(",", $product->image);
            //         $data['image'][$index] = $images[0];
            //         $index++;
            //     }
            // } else {
            $data['name'][$index] = $product->ItemName;
            $data['code'][$index] = $product->ItemCode;
            $images = explode(",", $product->ItemImage);
            $data['image'][$index] = $images[0];
            $index++;
            // }
        }
        return $data;
    }

    public function getFeatured()
    {
        $data = [];
        $lims_product_list = DB::table('item')->where([
            ['IsActive', true],
            ['IsFeatured', true]
        ])->select('item.ItemID', 'item.ItemName', 'item.ItemCode', 'item.ItemImage')->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            // if ($product->is_variant) {
            //     $lims_product_data = Product::select('id')->find($product->id);
            //     $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
            //     foreach ($lims_product_variant_data as $key => $variant) {
            //         $data['name'][$index] = $product->name . ' [' . $variant->name . ']';
            //         $data['code'][$index] = $variant->pivot['item_code'];
            //         $images = explode(",", $product->image);
            //         $data['image'][$index] = $images[0];
            //         $index++;
            //     }
            // } else {
            $data['name'][$index] = $product->ItemName;
            $data['code'][$index] = $product->ItemCode;
            $images = explode(",", $product->ItemImage);
            $data['image'][$index] = $images[0];
            $index++;
            // }
        }
        return $data;
    }

    public function extra_tax_charged(Request $request)
    { 
        $input = $request->all();
        $id=$request->sale_id;
        // dd($id);
        
        $lims_user_data = DB::table('invoice_master')->where('InvoiceMasterID', $InvoiceMasterID)->first();
        $lims_user_data->update($input);
        // return response()->json(['success'=>'Product saved successfully.']);
        return redirect()->back()->with('sale.invoice3', 'Data updated successfullly');
        // return 'hello';
    } 

   /*  public function generateCode()
    {
         
        $id = Keygen::numeric(8)->generate();
        echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($id, 'UPCA') . '" alt="barcode"   />';
        return $id;
    } */
}
