<?php

namespace App\Console\Commands;

use App\Models\Product;
use App\Models\ProductPromotion;
use Illuminate\Console\Command;
use Carbon\Carbon;

class CheckProductPromotedTime extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:check-product-promoted-time';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This commmad check and update the product promotion';

    /**
     * Execute the console command.
     */


    public function handle()
    {

        $promotedProducts = Product::where('is_promoted', 1)->pluck('id')->toArray();
        $promotions = ProductPromotion::whereIn('product_id', $promotedProducts)->get();
        foreach ($promotions as $promotion) {
            $endDate = Carbon::parse($promotion->promotion_end);
            if ($endDate->isPast()) {
                Product::where('id', $promotion->product_id)->update(['is_promoted' => 0]);
                $this->info("Product ID {$promotion->product_id} promotion ended and is_promoted set to 0.");
            }
        }
        $this->info('Promotion status check completed.');
    }

}
