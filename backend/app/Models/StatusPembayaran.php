<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatusPembayaran extends Model
{
    protected $table = 'status_pembayaran';
    protected $fillable = ['status_pembayaran'];
    public $timestamps = false;
}
