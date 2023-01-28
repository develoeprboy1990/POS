<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;
use Yajra\DataTables\DataTables;

use PDF;
class EstimateController extends Controller
{
    public function Estimate()
  {
    
    $pagetitle = 'All Delivery Challans';
    return view('estimate.estimate', compact('pagetitle'));
  }
   

  public function ajax_estimate(Request $request)
  {
    session::put('menu', 'Vouchers');
    $pagetitle = 'Delivery Challan';
    if ($request->ajax()) {
      $data = DB::table('v_estimate_master')->orderBy('EstimateMasterID')->get();
     
      return Datatables::of($data)
        ->addIndexColumn()
        ->addColumn('action', function ($row) {
          // if you want to use direct link instead of dropdown use this line below
          // <a href="javascript:void(0)"  onclick="edit_data('.$row->customer_id.')" >Edit</a> | <a href="javascript:void(0)"  onclick="del_data('.$row->customer_id.')"  >Delete</a>
          $btn = ' 
 
                       <div class="d-flex align-items-center col-actions">
                     
 
                <a href="' . URL('/EstimateView/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-eye-outline align-middle me-1 text-secondary"></i></a> 
                <a href="' . URL('/EstimateEdit/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-pencil align-middle me-1 text-secondary"></i></a> 
                <a  target="_blank" href="' . URL('/EstimateViewPDF/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-file-pdf-outline align-middle me-1 text-secondary"></i></a> 
                 <a href="' . URL('/EstimateDelete/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-trash-can-outline align-middle me-1 text-secondary"></i></a> 
                        
                          
 
                      
                       </div>';

          //class="edit btn btn-primary btn-sm"
          // <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
          return $btn;
        })
        ->rawColumns(['action'])
        ->make(true);
    }

    return view('estimate.estimate', 'pagetitle');
  }

   
  public function EstimateCreate()
  {
    
        // dd('reached');
        $pagetitle = 'Create Estimate';
        $party = DB::table('party')->get();
    
        $items = DB::table('item')->get();
        $item = json_encode($items);
        // dd($item);
        $user = DB::table('user')->get();
        $chartofacc = DB::table('chartofaccount')->get();
        $estimate_master = DB::table('estimate_master')
          ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as EstimateNo'))
          ->get();

         $tax = DB::table('tax')->where('Section','Estimate')->get();
 
        $challan_type = DB::table('challan_type')->get();
        $invoice_type = DB::table('invoice_type')->get();
        return view('estimate.estimate_create', compact('chartofacc', 'party', 'pagetitle', 'estimate_master', 'items', 'item', 'challan_type', 'user','invoice_type','tax'));
      
  }

  public  function EstimateSave(request $request)
  {
     
    $challan_mst = array(
      'EstimateNo' => $request->input('EstimateNo'),
      'PartyID' => $request->input('PartyID'),
      'WalkinCustomerName' => $request->input('WalkinCustomerName'),
      'PlaceOfSupply' => $request->input('PlaceOfSupply'),
      'ReferenceNo' => $request->input('ReferenceNo'),
      'Date' => $request->input('Date'),
      'EstimateDate' => $request->input('Date'),
       'ExpiryDate' => $request->input('DueDate'),
      'Subject' => $request->input('Subject'),
      'SubTotal' => $request->input('SubTotal'),
      'Discount' => $request->input('DiscountAmount'),
      'DiscountPer' => $request->input('DiscountPer'),

      'TaxType' => $request->input('TaxType'),
      'TaxPer' => $request->input('Taxpercentage'),
      'Tax' => $request->input('grandtotaltax'),
      'Shipping' => $request->input('Shipping'),
      'Total' => $request->input('Total'),
      'GrandTotal' => $request->input('Grandtotal'),
      'CustomerNotes' => $request->input('CustomerNotes'),
      'DescriptionNotes' => $request->input('DescriptionNotes'),
      'UserID' => session::get('UserID'),
    );
    // dd($challan_mst);
    // $id= DB::table('')->insertGetId($data);

    $EstimateMasterID = DB::table('estimate_master')->insertGetId($challan_mst);


    //  start for item array from invoice
    for ($i = 0; $i < count($request->ItemID); $i++) {
      $challan_det = array(
        'EstimateMasterID' =>  $EstimateMasterID,
        'EstimateNo' => $request->input('EstimateNo'),
        'EstimateDate' => $request->input('Date'),
        'ItemID' => $request->ItemID[$i],
        'Description' => $request->Description[$i],
         'TaxPer' => $request->Tax[$i],
         'Tax' => $request->TaxVal[$i],
        'Qty' => $request->Qty[$i],
        'Rate' => $request->Price[$i],
         'Total' => $request->ItemTotal[$i],
               'Discount' => $request->Discount[$i],
        'DiscountType' => $request->DiscountType[$i],
        'Gross' => $request->Gross[$i],
        'DiscountAmountItem' => $request->DiscountAmountItem[$i],

      );

      $id = DB::table('estimate_detail')->insertGetId($challan_det);
    }


    // end foreach

    // dd('hello');
    return redirect('Estimate')->with('error', 'Challan Saved')->with('class', 'success');
  }


  



  public function EstimateDelete($id)
  {

    $pagetitle = 'Estimate';
    $id = DB::table('estimate_master')->where('EstimateMasterID', $id)->delete();
    $id = DB::table('estimate_detail')->where('EstimateMasterID', $id)->delete();




    return redirect('Estimate')->with('error', 'Deleted Successfully')->with('class', 'success');
  }



  public function EstimateView($id)
  {
    // dd('hello');
    $pagetitle = 'Estimate';
    $estimate = DB::table('v_estimate_master')->where('EstimateMasterID', $id)->get();
    $estimate_detail = DB::table('v_estimate_detail')->where('EstimateMasterID', $id)->get();
    $company = DB::table('company')->get();
    
    session()->forget('VHNO');

    session::put('VHNO',$estimate[0]->EstimateNo);



     return view('estimate.estimate_view', compact('estimate', 'pagetitle', 'company', 'estimate_detail'));
  }

    public function EstimateViewPDF($id)
  {
    // dd('hello');
    $pagetitle = 'Estimate';
    $estimate = DB::table('v_estimate_master')->where('EstimateMasterID', $id)->get();
    $estimate_detail = DB::table('v_estimate_detail')->where('EstimateMasterID', $id)->get();
    $company = DB::table('company')->get();
     $pdf = PDF::loadView ('estimate.estimate_view_pdf', compact('estimate', 'pagetitle', 'company', 'estimate_detail'));
    //return $pdf->download('pdfview.pdf');
      // $pdf->setpaper('A4', 'portiate');
        return $pdf->stream();
   }


  public function EstimateEdit($id)
  {
    // dd($id);
    $pagetitle = 'Estimate';
    $party = DB::table('party')->get();

    $tax = DB::table('tax')->get();

    $items = DB::table('item')->get();
    $item = json_encode($items);
    // dd($item);
    $user = DB::table('user')->get();
     $chartofacc = DB::table('chartofaccount')->get();
    $challan_master = DB::table('challan_master')
      ->select(DB::raw('LPAD(IFNULL(MAX(ChallanMasterID),0)+1,4,0) as ChallanMasterID'))
      ->get();
    $challan_type = DB::table('challan_type')->get();
    $estimate_master = DB::table('estimate_master')->where('EstimateMasterID', $id)->get();
    $estimate_detail = DB::table('estimate_detail')->where('EstimateMasterID', $id)->get();
    // dd($estimate_detail);


    
    return view('estimate.estimate_edit', compact('chartofacc', 'party', 'pagetitle', 'estimate_master', 'items', 'item',  'user',  'estimate_detail','tax'));
  }


  public  function EstimateUpdate(request $request)
  {
 
     $estimate_mst = array(
      'EstimateNo' => $request->input('EstimateNo'),
      'PartyID' => $request->input('PartyID'),
      'WalkinCustomerName' => $request->input('WalkinCustomerName'),
      'PlaceOfSupply' => $request->input('PlaceOfSupply'),
      'ReferenceNo' => $request->input('ReferenceNo'),
      'Date' => $request->input('EstimateDate'),
      'EstimateDate' => $request->input('EstimateDate'),
      'ExpiryDate' => $request->input('DueDate'),
      'Subject' => $request->input('Subject'),
      'SubTotal' => $request->input('SubTotal'),
      'Discount' => $request->input('DiscountAmount'),
      'DiscountPer' => $request->input('DiscountPer'),
       'TaxType' => $request->input('TaxType'),
      'TaxPer' => $request->input('Taxpercentage'),
      'Tax' => $request->input('grandtotaltax'),
      'Shipping' => $request->input('Shipping'),
      'Total' => $request->input('Total'),
      'Grandtotal' => $request->input('Grandtotal'),
      'CustomerNotes' => $request->input('CustomerNotes'),
      'DescriptionNotes' => $request->input('DescriptionNotes'),
      'UserID' => session::get('UserID'),
    );


    // dd($challan_mst);
    // $id= DB::table('')->insertGetId($data);
    // dd($request->EstimateMasterID);
    $challanmaster = DB::table('estimate_master')->where('EstimateMasterID', $request->EstimateMasterID)->update($estimate_mst);

      $challanmasterdelete = DB::table('estimate_detail')->where('EstimateMasterID', $request->EstimateMasterID)->delete();





    $EstimateMasterID=$request->EstimateMasterID;
     
  // dd($ChallanMasterID);
    // when full payment is made


    // END OF SALE RETURN

    //  start for item array from invoice
    for ($i = 0; $i < count($request->ItemID); $i++) {
      $estimate_detail = array(
       'EstimateMasterID' =>  $EstimateMasterID,
        'EstimateNo' => $request->input('EstimateNo'),
        'EstimateDate' => $request->input('Date'),
        'ItemID' => $request->ItemID[$i],
        'Description' => $request->Description[$i],
         'TaxPer' => $request->Tax[$i],
         'Tax' => $request->TaxVal[$i],
        'Qty' => $request->Qty[$i],
        'Rate' => $request->Price[$i],
         'Total' => $request->ItemTotal[$i],
          'Discount' => $request->Discount[$i],
        'DiscountType' => $request->DiscountType[$i],
        'Gross' => $request->Gross[$i],
        'DiscountAmountItem' => $request->DiscountAmountItem[$i],

      );
      
      $id = DB::table('estimate_detail')->insertGetId($estimate_detail);
      
    }


    // end foreach


    return redirect('Estimate')->with('error', 'Challan Saved')->with('class', 'success');
  }
}
