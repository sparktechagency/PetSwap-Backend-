<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $settings=[
            [
                "type"=> "Terms and Conditions",
                "data"=> "By accessing or using our services, you agree to these Terms and Conditions. If you do not agree, you must not use our services.",
                "created_at"=>now(),
                "updated_at"=>now()
            ],
            [
                "type"=> "Legal Notes",
                "data"=> "The information provided on this platform is for general informational purposes only. While we make every effort to ensure accuracy, we do not guarantee completeness, reliability, or error-free content.",
                "created_at"=>now(),
                "updated_at"=>now()
            ],
            [
                "type"=> "Our Platform",
                "data"=> "Welcome to [Your Platform Name], your trusted destination for [brief description of your platform’s purpose or value proposition]. Our platform is designed to bring together [key audience or stakeholders, e.g., users, professionals, businesses, buyers, sellers, etc.] in a seamless, innovative, and user-friendly environment.",
                "created_at"=>now(),
                "updated_at"=>now()
            ],
        ];
        Setting::insert($settings);
    }
}
