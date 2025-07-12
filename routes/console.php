<?php

use App\Console\Commands\PaymentRelese;
use Illuminate\Support\Facades\Schedule;

// Schedule::command(CheckProductPromotedTime::class)->daily();
Schedule::command(PaymentRelese::class)->everyMinute();
