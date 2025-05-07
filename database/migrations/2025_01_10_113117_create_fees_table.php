<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fees', function (Blueprint $table) {
            $table->id();
            $table->float('platform_fee',8,2)->default(2);
            $table->float('delivery_fee',8,2)->default(4);
            $table->float('buyer_protection_fee',8,2)->default(5)->comment('in %');
            $table->float('per_day_promotion_amount',8,2)->default(2);
            $table->timestamps();
        });
    }

    /*
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fees');
    }
};
