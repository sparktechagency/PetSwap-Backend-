<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class OfferAskingNotification extends Notification
{
    use Queueable;

    public $notification_data;

    /**
     * Create a new notification instance.
     *
     * @param array $notification_data
     */
    public function __construct($notification_data)
    {
        $this->notification_data = $notification_data;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database']; // Use the database channel
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'image' => $this->notification_data['buyer_image'],
            'title' => $this->notification_data['buyer_name'] . ' sent you an offer request',
            'product_id' => $this->notification_data['product_id'],
            'offer_id' => $this->notification_data['offer_id'],
            'type'=>'pending',
        ];
    }
}
