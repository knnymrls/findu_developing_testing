import 'package:findu_developing_testing/models/college.dart';
import 'package:flutter/material.dart';

class CollegePage extends StatelessWidget {
  final College college;

  // Constructor
  CollegePage({required this.college});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(college.name), // Use the college's name in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${college.name}", style: TextStyle(fontSize: 24)),
            Text("City: ${college.city}", style: TextStyle(fontSize: 20)),
            Text("State: ${college.state}", style: TextStyle(fontSize: 20)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
