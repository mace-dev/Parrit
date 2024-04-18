import 'package:flutter/material.dart';
import 'custom_dialog.dart'; // Import the custom dialog file
import 'notification_item.dart'; // Import the NotificationItem widget

class ParritHomePage extends StatefulWidget {
  const ParritHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ParritHomePageState createState() => _ParritHomePageState();
}

class _ParritHomePageState extends State<ParritHomePage> {
  List<String> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02D8E9),
      body: Stack(
        children: [
          // Container for "Parrit" app title
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Center(
                child: Text(
                  'Parrit',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Container for notifications
          Positioned(
            top: 100,
            left: 10,
            right: 10,
            bottom: 90, // Adjusted to leave space for the action button
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: notifications.map((notification) {
                    return NotificationItem(notification: notification);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the custom dialog for adding notifications
          showCustomDialog(context, (List<String> addedNotifications) {
            setState(() {
              notifications.addAll(addedNotifications);
            });
          }); // Call the custom dialog function
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}