import 'package:admin/screen/notif_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to send the notification?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                
                // Call the send notification function
              NotificationService.sendNotification(title: titleController.text, description: messageController.text, );
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Magic AI Admin', style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 114, 33, 129)),))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _showConfirmationDialog(context),
              child: Text('Send Notification',style: TextStyle(color: const Color.fromARGB(255, 114, 33, 129),),))
          ],
        ),
      ),
    );
  }
}
