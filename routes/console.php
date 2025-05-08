<?php

use App\Console\Commands\CheckProductPromotedTime;
use App\Console\Commands\PaymentRelese;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

// Artisan::command('inspire', function () {
//     $this->comment(Inspiring::quote());
// })->purpose('Display an inspiring quote')->hourly();


Schedule::command(CheckProductPromotedTime::class)->daily();
Schedule::command(PaymentRelese::class)->daily();
