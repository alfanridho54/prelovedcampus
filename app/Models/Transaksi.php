<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';
    protected $fillable = ['jumlah_beli', 'total_harga', 'metode_pembayaran', 'tanggal_transaksi', 'user_id', 'produk_id', 'status_pembayaran_id'];
    public $timestamps = false;
}
