<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Admin Name',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('1234'),
            'role' => 'ADMIN',
            'email_verified_at'=> now(),
        ]);
    }
}
