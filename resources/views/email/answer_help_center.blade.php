<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333333;
            margin: 0;
            padding: 0;
        }
        .email-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #ffffff;
            border: 1px solid #eaeaea;
            border-radius: 8px;
            overflow: hidden;
        }
        .header {
            background-color: #007BFF;
            color: #ffffff;
            text-align: center;
            padding: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .content {
            padding: 20px;
        }
        .content p {
            margin: 15px 0;
            line-height: 1.6;
        }
        .content .request, .content .response {
            background-color: #f4f4f4;
            padding: 15px;
            border-left: 4px solid #007BFF;
            margin: 10px 0;
        }
        .footer {
            text-align: center;
            padding: 15px;
            background-color: #f4f4f4;
            font-size: 12px;
            color: #666666;
        }
        .footer a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <h1>Help Center Response</h1>
        </div>
        <div class="content">
            <p>Dear <strong>{{ $user->name }}</strong>,</p>
            <p>Thank you for reaching out to us. Below are the details of your help request and our response:</p>

            <div class="request">
                <h3>Your Request</h3>
                <p><strong>Subject:</strong> {{ $help_center->subject }}</p>
                <p><strong>Description:</strong> {{ $help_center->description }}</p>
            </div>

            <div class="response">
                <h3>Our Response</h3>
                <p>{{ $help_center->answer }}</p>
            </div>

            <p>If you have any further questions, feel free to reply to this email or contact us through the Help Center.</p>
            <p>Thank you for giving us the opportunity to assist you.</p>
        </div>
        <div class="footer">
            <p>Best regards,<br><strong>PetSwap Support Team</strong></p>
        </div>
    </div>
</body>
</html>
