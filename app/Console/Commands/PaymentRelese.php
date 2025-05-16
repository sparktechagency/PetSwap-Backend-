<?php
namespace App\Console\Commands;

use App\Models\Payment;
use App\Models\User;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Stripe\PaymentIntent;
use Stripe\Refund;
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

        // Release held payments after 6 days
        $heldPayments = Payment::where('status', 'Received')
            ->where('created_at', '<=', now()->subDays(6))
            ->get();

        foreach ($heldPayments as $payment) {
            try {
                $intent = PaymentIntent::retrieve($payment->stripe_payment_id);
                if ($intent->status === 'requires_capture') {
                    $intent->capture();
                    Transfer::create([
                        'amount'      => (int) ($payment->amount * 100),
                        'currency'    => 'usd',
                        'destination' => User::find($payment->seller_id)->stripe_account_id,
                        'description' => 'Product Payment Transfer',
                    ]);
                }

                Payment::where('id', $payment->id)
                    ->update(['status' => 'Completed', 'updated_at' => now()]);
            } catch (Exception $e) {
                Log::error('Payment Release Error: ' . $e->getMessage());
            }
        }

        // Refund payments still pending after 3 days
        $pendingPayments = Payment::where('status', 'Pending')
            ->where('created_at', '<=', now()->subDays(3))
            ->get();

        foreach ($pendingPayments as $payment) {
            try {
                Refund::create([
                    'payment_intent' => $payment->stripe_payment_id,
                    // 'amount' => (int) $refundAmount,
                ]);

                Payment::where('id', $payment->id)
                    ->update(['status' => 'Failed', 'updated_at' => now()]);
            } catch (Exception $e) {
                Log::error('Refund Error: ' . $e->getMessage());
            }
        }
    }

}
