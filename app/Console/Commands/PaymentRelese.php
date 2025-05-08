<?php
namespace App\Console\Commands;

use App\Models\Payment;
use App\Models\User;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Stripe\PaymentIntent;
use Stripe\Stripe;
use Stripe\Transfer;

class PaymentRelese extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:payment-relese';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $heldPayments = Payment::where('status', 'On Hold')
            ->where('created_at', '<=', now()->subDays(7))
            ->get();

        foreach ($heldPayments as $payment) {
            try {
                $intent = PaymentIntent::retrieve($payment->stripe_payment_id);
                $intent->capture();
                Transfer::create([
                    'amount'      => (int) ($payment->amount * 100),
                    'currency'    => 'usd',
                    'destination' => User::find($payment->seller_id)->stripe_account_id,
                    'description' => 'Product Payment Transfer',
                ]);

                Payment::where('id', $payment->id)
                    ->update(['status' => 'Completed', 'updated_at' => now()]);
            } catch (Exception $e) {
                Log::error('Payment Relese Error: ' . $e->getMessage());
            }
        }
    }
}
