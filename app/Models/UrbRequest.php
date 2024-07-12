<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UrbRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'file_type',
        'procurationFile',
        'topographiqueFile',
        'architectFile',
        'proprietyFile',
        'user_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }



}
