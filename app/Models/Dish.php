<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dish extends Model
{
    protected $fillable = ['name','description','image_thumbnail','status'];
    use HasFactory;

    public function getRouteKeyName()
    {
        return 'id';
    }
}
