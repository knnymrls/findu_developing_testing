import 'package:findu_developing_testing/mocks/student_mock.dart';
import 'package:findu_developing_testing/models/college.dart';
import 'package:flutter/material.dart';
import 'package:findu_developing_testing/models/user.dart';
import 'package:findu_developing_testing/models/match.dart';

class CollegePage extends StatelessWidget {
  final College college;

  // Constructor
  CollegePage({required this.college});

  @override
  Widget build(BuildContext context) {
    User user = MockUser.fetch(0);

    final int matchScore = calculateMatchScore(user, college);
    return Scaffold(
      appBar: AppBar(
        title: Text(college.name), // Use the college's name in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Match Score: ${matchScore}%", style: TextStyle(fontSize: 24)),
            Text("Name: ${college.name}", style: TextStyle(fontSize: 24)),
            Text("City: ${college.city}", style: TextStyle(fontSize: 20)),
            Text("State: ${college.state}", style: TextStyle(fontSize: 20)),
            Text("Admissons Rate: ${college.admissionRate}"),
            Text("Average SAT score: ${college.averageSAT}"),
            Text("Size of Student Body: ${college.size}"),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
