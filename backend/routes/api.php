<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KategoriProdukController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\Api\AuthController;

// Rute otentikasi
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

// Rute kategori produk
Route::get('/kategori-produk', [KategoriProdukController::class, 'index']);
Route::get('/kategori-produk/{id}', [KategoriProdukController::class, 'show']);

// Rute produk
Route::get('/produk', [ProdukController::class, 'index']);
Route::get('/produk/{id}', [ProdukController::class, 'show']);
Route::post('/produk/create', [ProdukController::class, 'store']);
Route::middleware(['auth:sanctum', 'peran:admin-penjual'])->group(function () {
    Route::put('/produk/update/{id}', [ProdukController::class, 'update']);
    Route::delete('/produk/delete/{id}', [ProdukController::class, 'destroy']);
});

// Rute transaksi
Route::middleware(['auth:sanctum', 'peran:admin-penjual-customer'])->group(function () {
    Route::get('/transaksi', [TransaksiController::class, 'index']);
    Route::get('/transaksi/{id}', [TransaksiController::class, 'show']);
    Route::post('/transaksi/create', [TransaksiController::class, 'store']);
    Route::put('/transaksi/update/{id}', [TransaksiController::class, 'updateStatusPembayaran']);
    Route::delete('/transaksi/delete/{id}', [TransaksiController::class, 'destroy']);
});

// Rute pengguna (user)
Route::middleware(['auth:sanctum', 'peran:admin'])->group(function () {
    Route::get('/user', [UserController::class, 'index']);
    Route::get('/user/{id}', [UserController::class, 'show']);
    Route::post('/user/create', [UserController::class, 'store']);
    Route::put('/user/update/{id}', [UserController::class, 'update']);
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy']);
});

// Rute kategori produk untuk admin
Route::middleware(['auth:sanctum', 'peran:admin'])->group(function () {
    Route::post('/kategori-produk/create', [KategoriProdukController::class, 'store']);
    Route::put('/kategori-produk/update/{id}', [KategoriProdukController::class, 'update']);
    Route::delete('/kategori-produk/delete/{id}', [KategoriProdukController::class, 'destroy']);
});
