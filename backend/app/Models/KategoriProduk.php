<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KategoriProduk extends Model
{
    use HasFactory;

    protected $table = 'kategori_produk';

    public $timestamps = false;

    protected $fillable = [
        'kategori',
    ];

    public function produk()
    {
        return $this->hasMany(Produk::class, 'kategori_produk_id');
    }
}

