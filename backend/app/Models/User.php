<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles; // Tambahkan import trait HasRoles

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles; // Tambahkan HasRoles di sini

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table = 'user';
    protected $fillable = [
        'nama',
        'email',
        'password',
        'foto',
        'no_hp',
        'alamat',
        'role',  // Jika ingin tetap menggunakan kolom role pada tabel
    ];

    public $timestamps = false;

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /**
     * Get the transactions associated with the user.
     */
    public function transaksi()
    {
        return $this->hasMany(Transaksi::class, 'user_id');
    }

    // Method to check if user is a seller
    public function isPenjual()
    {
        return $this->hasRole('penjual'); // Pastikan role 'penjual' sudah ada
    }
}
