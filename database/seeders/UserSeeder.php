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
        User::create([
            'name' => 'Demo User 1',
            'email' => 'user1@gmail.com',
            'password' => Hash::make('1234'),
            'role' => 'USER',
            'email_verified_at'=> now(),
        ]);
        User::create([
            'name' => 'Demo User 2',
            'email' => 'user2@gmail.com',
            'password' => Hash::make('1234'),
            'role' => 'USER',
            'email_verified_at'=> now(),
        ]);
        User::create([
            'name' => 'Demo User 3',
            'email' => 'user3@gmail.com',
            'password' => Hash::make('1234'),
            'role' => 'USER',
            'email_verified_at'=> now(),
        ]);
        User::create([
            'name' => 'Demo User 4',
            'email' => 'user4@gmail.com',
            'password' => Hash::make('1234'),
            'role' => 'USER',
            'email_verified_at'=> now(),
        ]);
    }
}
