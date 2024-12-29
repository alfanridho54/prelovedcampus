<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;

    protected $table = 'produk';

    protected $fillable = [
        'nama',
        'harga',
        'deskripsi',
        'stok',
        'lokasi_gambar',
        'kategori_produk_id',
        'penjual_id',
    ];

    public $timestamps = false;

    // Scope untuk filter produk milik penjual tertentu
    public function scopeMilikPenjual($query, $penjualId)
    {
        return $query->where('penjual_id', $penjualId);
    }

    // Relasi ke kategori
    public function kategoriProduk()
    {
        return $this->belongsTo(KategoriProduk::class, 'kategori_produk_id');
    }

    // Relasi ke pengguna (penjual)
    public function penjual()
    {
        return $this->belongsTo(User::class, 'penjual_id');
    }
}
