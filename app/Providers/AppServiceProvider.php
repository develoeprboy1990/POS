<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Session;
use DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        /* NEW TEQ POS SETTING */
       /*  if(isset($_COOKIE['language'])) {
            \App::setLocale($_COOKIE['language']);
        } else {
            \App::setLocale('en');
        } */
        //get general setting value        
        /* $general_setting = DB::table('general_settings')->latest()->first();
        $currency = \App\Models\Currency::find($general_setting->currency);
        View::share('general_setting', $general_setting);
        View::share('currency', $currency);
        config(['staff_access' => $general_setting->staff_access, 'date_format' => $general_setting->date_format, 'currency' => $currency->code, 'currency_position' => $general_setting->currency_position]);
        
        $alert_product = DB::table('products')->where('is_active', true)->whereColumn('alert_quantity', '>', 'qty')->count(); */
        //View::share('alert_product', $alert_product);
        //Schema::defaultStringLength(191);
        /* NEW TEQ POS SETTING ENDS HERE. */

        $currency = Session::get('Currency');
        $currency_position = 'prefix';
        config(['currency' => $currency, 'currency_position' => $currency_position]);

        view()->composer('*', function ($view) {
            $isAdmin = session::get('isAdmin');
            if($isAdmin == 1){
                $branch = DB::table('branch')->get();
            }
            else{
                $branch_id = Session::get('BranchID');
                $branch = DB::table('branch')->where('BranchID',$branch_id)->get();
            }
            $view->with(compact('branch'));
        });
    }
}
