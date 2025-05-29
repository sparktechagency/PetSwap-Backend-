<?php

use App\Console\Commands\CheckProductPromotedTime;
use App\Console\Commands\PaymentRelese;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;


// Schedule::command(CheckProductPromotedTime::class)->daily();
Schedule::command(PaymentRelese::class)->daily();
