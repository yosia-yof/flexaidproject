import 'package:flexaidproject/HelpRequestScreen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  final String userName;

  UserHomeScreen({this.userName = "Alex"}); // Replace with actual user's name later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text('FlexAid'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Welcome Message
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome, $userName 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Enlarged Map Placeholder
            Container(
              height: 300, // increased height from 200 → 260
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/map_placeholder.png'), // replace with real map later
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Map loading...',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Help Request Button
            ElevatedButton.icon(
              icon: Icon(Icons.warning, color: Colors.white),
              label: Text(
                'Request Assistance',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                // Navigate to Help Request screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpRequestScreen()),
                );
              },
            ),
            SizedBox(height: 30),

            // Request Status Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.blue, size: 36),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Request Status', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          'No active service requests.',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
