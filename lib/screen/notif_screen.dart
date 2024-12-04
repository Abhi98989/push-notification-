import 'dart:convert';
import 'package:admin/keys/api_keys.dart'; // Ensure this path is correct
import 'package:http/http.dart' as http;

class NotificationService {
  //String _serverKey = 'YOUR_SERVER_KEY_HERE'; // Replace with your Firebase server key
  static String url = 'https://api.onesignal.com/notifications';

  static sendNotification({
    required String title,
    required String description,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Basic ${ApiKeys.onesignalApiKey}",
        },
        body: jsonEncode({
          "app_id":ApiKeys.appID,
          "contents":{"en":description},
          "included_segments":["Total Subscriptions", "Active Subscriptions"],
          "headings":{
            "en":title,
          }
        }),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully: ${response.body}');
      } else {
        print('Failed to send notification: ${response.body}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
