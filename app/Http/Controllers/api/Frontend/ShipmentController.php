<?php
namespace App\Http\Controllers\api\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use Illuminate\Support\Facades\Http;

class ShipmentController extends Controller
{
    // public function createShipment(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'name' => 'required|string',
    //         'address' => 'required|string',
    //         'city' => 'required|string',
    //         'postal_code' => 'required|string',
    //         'country' => 'required|string|size:2',
    //         'email' => 'required|email',
    //         'telephone' => 'required|string',
    //         'shipping_method' => 'required|numeric',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'status' => false,
    //             'message' => $validator->errors()
    //         ], 400);
    //     }

    //     return 'a';
    //     // ✅ Prepare shipment data
    //     $shipmentData = [
    //         'shipment' => [
    //             'name' => $request->name,
    //             'address' => $request->address,
    //             'city' => $request->city,
    //             'postal_code' => $request->postal_code,
    //             'country' => $request->country,
    //             'email' => $request->email,
    //             'telephone' => $request->telephone,
    //             'shipping_method' => $request->shipping_method,
    //         ]
    //     ];

    //     try {
    //         // ✅ Make API request to Sendcloud
    //         $response = Http::withBasicAuth(
    //             env('SENDCLOUD_PUBLIC_KEY'),
    //             env('SENDCLOUD_SECRET_KEY')
    //         )->post('https://panel.sendcloud.sc/api/v2/shipments', $shipmentData);

    //         if ($response->successful()) {
    //             $shipment = $response->json();

    //             return response()->json([
    //                 'message' => 'Shipment created successfully!',
    //                 'shipment_id' => $shipment['shipment']['id'],
    //                 'label_url' => $shipment['shipment']['label']['normal_printer'],
    //                 'tracking_number' => $shipment['shipment']['tracking_number'],
    //             ]);
    //         } else {
    //             return response()->json([
    //                 'error' => 'Failed to create shipment',
    //                 'details' => $response->body()
    //             ], 500);
    //         }
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'error' => 'Sendcloud API request failed',
    //             'message' => $e->getMessage()
    //         ], 500);
    //     }
    // }

    // public function createShipment()
    // {
    //     try {
    //         $response = Http::withBasicAuth(
    //             env('SENDCLOUD_PUBLIC_KEY'),
    //             env('SENDCLOUD_SECRET_KEY')
    //         )->get('https://panel.sendcloud.sc/api/v2/shipping_methods');

    //         if ($response->successful()) {
    //             return response()->json([
    //                 'status' => true,
    //                 'methods' => $response->json()
    //             ]);
    //         } else {
    //             return response()->json([
    //                 'status' => false,
    //                 'message' => 'Failed to fetch shipping methods',
    //                 'error' => $response->body()
    //             ], 500);
    //         }
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status' => false,
    //             'message' => 'Error occurred while fetching shipping methods',
    //             'error' => $e->getMessage()
    //         ], 500);
    //     }
    // }

//     public function getTrackingInfo($shipmentId)
// {
//     $response = Http::withBasicAuth(
//         env('SENDCLOUD_PUBLIC_KEY'),
//         env('SENDCLOUD_SECRET_KEY')
//     )->get("https://panel.sendcloud.sc/api/v2/shipments/{$shipmentId}");

//     if ($response->successful()) {
//         return response()->json([
//             'shipment_status' => $response->json(),
//         ]);
//     }

//     return response()->json([
//         'error' => 'Failed to fetch tracking info',
//     ], 500);
// }

public function createShipment()
{
    $payload = [
        "parcel" => [
            "name" => "John Doe",
            "company_name" => "FlowerShop",
            "email" => "john@doe.com",
            "telephone" => "+31611223344",
            "address" => "Fürstenrieder Str.",
            "house_number" => "70",
            "address_2" => "",
            "city" => "Munich",
            "country" => "DE",
            "postal_code" => "80686",
            "country_state" => null,
            "customs_invoice_nr" => "",
            "customs_shipment_type" => null,
            "parcel_items" => [
                [
                    "description" => "T-Shirt",
                    "hs_code" => "6109",
                    "origin_country" => "SE",
                    "product_id" => "898678671",
                    "properties" => [
                        "color" => "Blue",
                        "size" => "Medium"
                    ],
                    "quantity" => 2,
                    "sku" => "TST-OD2019-B620",
                    "value" => "19.95",
                    "weight" => "0.9"
                ],
                [
                    "description" => "Laptop",
                    "hs_code" => "84713010",
                    "origin_country" => "DE",
                    "product_id" => "5756464758",
                    "properties" => [
                        "color" => "Black",
                        "internal_storage" => "2TB"
                    ],
                    "quantity" => 1,
                    "sku" => "LT-PN2020-B23",
                    "value" => "876.97",
                    "weight" => "1.69"
                ]
            ],
            "weight" => "3.49",
            "length" => "31.5",
            "width" => "27.2",
            "height" => "12.7",
            "total_order_value" => "896.92",
            "total_order_value_currency" => "EUR",
            "shipment" => [
                "id" => 1316,
                "name" => "DHL Parcel Connect 2-5kg to ParcelShop"
            ],
            "shipping_method_checkout_name" => "Battery WarehouseX DHL",
            "sender_address" => 253456,
            "quantity" => 1,
            "total_insured_value" => 0,
            "is_return" => false,
            "request_label" => true, // Changed to true to get label
            "apply_shipping_rules" => false,
            "request_label_async" => false
        ]
    ];

    try {
        $response = Http::withHeaders([
            'Authorization' => 'Basic ' . base64_encode(env('SENDCLOUD_API_PUBLIC_KEY') . ':' . env('SENDCLOUD_API_SECRET_KEY')),
            'Content-Type' => 'application/json',
        ])->post('https://panel.sendcloud.sc/api/v2/parcels', $payload);

        if ($response->successful()) {
            $shipment = $response->json()['parcel'];

            // Uncomment and modify if you have an order to update
            /*
            $order->update([
                'shipment_id'  => $shipment['id'],
                'awb_number'   => $shipment['awb_number'],
                'status'       => 'Shipped',
                'tracking_url' => $shipment['tracking_url'] ?? null,
            ]);
            */

            return response()->json([
                'success' => true,
                'message' => 'Shipment created successfully!',
                'data' => $shipment,
                'label_url' => $shipment['label']['label_url'] ?? null
            ]);
        } else {
            return response()->json([
                'error' => true,
                'message' => 'Failed to create shipment.',
                'details' => $response->json()
            ], 400);
        }
    } catch (\Exception $e) {
        return response()->json([
            'error' => true,
            'message' => 'API request failed',
            'exception' => $e->getMessage()
        ], 500);
    }
}
}
