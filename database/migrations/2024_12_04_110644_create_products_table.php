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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('category_id')->constrained('categories')->cascadeOnDelete();
            // $table->foreignId('sub_category_id')->nullable()->constrained('sub_categories')->cascadeOnDelete();
            $table->json('sub_category_id');
            $table->string('title');
            $table->text('description')->nullable();
            $table->json('images')->nullable();
            $table->float('price');
            $table->float('platform_fee')->nullable();
            $table->string('brand')->nullable();
            $table->string('condition')->nullable();
            $table->boolean('is_food')->default(false);
            $table->string('weight')->nullable();
            $table->unsignedBigInteger('view_count')->default(0);
            $table->enum('status', ['Approved','Pending','Canceled'])->default('Pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
