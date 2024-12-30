<!DOCTYPE html>
<html>
<head>
    <title>Admin Support Notification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333333;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .header {
            background-color: #333399;
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
            line-height: 1.6;
        }
        .content h2 {
            margin-top: 0;
        }
        .button-container {
            text-align: center;
            margin: 20px 0;
        }
        .button {
            background-color: #333399;
            color: #ffffff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .button:hover {
            background-color: #2a2870;
        }
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 12px;
            background-color: #f4f4f9;
            color: #888888;
        }
        .footer a {
            color: #333399;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <h1>New Support Request</h1>
        </div>

        <!-- Content Section -->
        <div class="content">
            <h2>Hello Admin,</h2>
            <p>You have received a new support request that requires your attention. Below are the details:</p>
            <ul>
                <li><strong>User Name:</strong> {{ $help_center->user->name }}</li>
                <li><strong>Email:</strong> {{ $help_center->user->email }}</li>
                <li><strong>Subject:</strong> {{ $help_center->subject }}</li>
                <li><strong>Description:</strong> {{ $help_center->description }}</li>
                <li><strong>Submitted on:</strong> {{ date('M d, Y') }}</li>
            </ul>
            {{-- <p>To review and respond to the request, please click the button below:</p> --}}

            {{-- <div class="button-container">
                <a href="#" class="button">View Support Request</a>
            </div>

            <p>If you have any questions or need further assistance, please reach out to the IT team.</p> --}}

            <p>Best regards,</p>
            <p>PetSwap </p>
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>This notification was sent to you as an administrator of [PetSwap].</p>
            {{-- <p><a href="[Admin Panel Link]">Admin Panel</a> | <a href="[Support Email]">Contact IT Support</a></p> --}}
        </div>
    </div>
</body>
</html>
