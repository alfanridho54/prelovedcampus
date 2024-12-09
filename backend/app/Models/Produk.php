<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    //
    protected $table = 'produk';
    protected $fillable = ['nama', 'harga', 'deskripsi', 'stok', 'lokasi_gambar', 'kategori_produk_id'];
    public $timestamps = false;
}
