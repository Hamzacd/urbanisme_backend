<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    // protected $primaryKey = [
    //     'role', 'user_id'
    // ];
    // public $incrementing = false;


    protected $fillable = [
        'role', 'user_id'
    ];
}
