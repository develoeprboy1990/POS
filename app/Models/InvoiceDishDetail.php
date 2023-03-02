<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceDishDetail extends Model
{
    protected $fillable = ['invoice_master_id','dish_id'];
    use HasFactory;
}
