<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTimestampsToUserTable extends Migration
{
    public function up()
    {
        Schema::table('user', function (Blueprint $table) {
            $table->timestamps(); // Menambahkan kolom created_at dan updated_at
        });
    }

    public function down()
    {
        Schema::table('user', function (Blueprint $table) {
            $table->dropColumn(['created_at', 'updated_at']);
        });
    }
}
