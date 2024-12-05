<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Faq;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FAQController extends Controller
{
    public function index()
    {
        $faqs = Faq::get();
        return response()->json([
            'status' => true,
            'data' => $faqs,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required|string|max:255',
            'answer' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $faq = Faq::create([
            'question' => $request->question,
            'answer' => $request->answer,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'FAQ created successfully.',
            'data' => $faq,
        ], 200);
    }

    public function update(Request $request, $id)
    {

        $faq = Faq::find($id);
        if (!$faq) {
            return response()->json(['status' => false, 'message' => 'FAQ not found.'], 404);
        }

        $validator = Validator::make($request->all(), [
            'question' => 'required|string|max:255',
            'answer' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $faq->update([
            'question' => $request->question,
            'answer' => $request->answer,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'FAQ updated successfully.',
            'data' => $faq,
        ], 200);
    }

    public function delete($id)
    {
        $faq = Faq::find($id);

        if (!$faq) {
            return response()->json(['status' => false, 'message' => 'FAQ not found.'], 404);
        }
        $faq->delete();

        return response()->json([
            'status' => true,
            'message' => 'FAQ deleted successfully.',
        ], 200);
    }
}
