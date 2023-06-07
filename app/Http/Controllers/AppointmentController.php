<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Image;
use DB;
use session;
use Yajra\DataTables\DataTables;
use App\Models\Appointment;
use App\Models\Customer;
use App\Models\Service;
use App\Models\Client;
use App\Models\Employee;

class AppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $pagetitle               = 'Appointments';
        if ($request->ajax()) {
            $cases = Appointment::select(sprintf('%s.*', (new Appointment)->table));
            $table = Datatables::of($cases);
            $table->rawColumns(['active'])
                ->addColumn('actions', function ($cases) {
                    $html = "<div class='d-inline-block text-nowrap'>
                    <a href='' title='Show Details'>
                    <span class='btn btn-success bg-label-danger rounded'><i class='bx bx-show-alt'></i></span></a>";
                    $rmove = "</div><div class='btn-group'><button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' title='more options'>Options</button>
                        <div class='dropdown-menu'><a  href='' class='dropdown-item case-edit'><box-icon name='screen'></box-icon> Quick Edit</a>
                            <a data-id =''  class='dropdown-item editcase'><box-icon name='screen'></box-icon> Update Case</a>
                        </div></div>";
                    $html = '<div class="btn-group"><button type="button" class="btn btn-primary"> Action </button><button type="button" class="btn btn-primary dropdown-toggle dropdown-icon"  data-toggle="dropdown" >
                      <span class="sr-only">Toggle Dropdown</span></button>
                    <div class="dropdown-menu" role="menu"><a class="dropdown-item showinstitute" href="" title="Show Details" ><i class="bx bx-show-alt"></i>Details View</a> ';
                    $html .= '  </div></div>';
                    return $html;
                })->rawColumns(['active', 'actions']);
            return $table->make(true);
        }
        return view('appointments.index', compact('pagetitle'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $clients                 = DB::table('party')->where('Active', 'Yes')->get();
        $pagetitle               = 'Book Appointments';

        //$clients = Client::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        $employees = Employee::all()->pluck('name', 'id')->prepend(trans('Please Select'), '');
        $services = Service::all()->pluck('name', 'id');
        return view('appointments.create', compact('clients', 'employees', 'services'));
    }

    public function store(Request $request)
    { 
        $appointment = Appointment::create($request->all());
        $appointment->services()->sync($request->input('services', []));
        return redirect()->route('appointments.index');
    }
}
