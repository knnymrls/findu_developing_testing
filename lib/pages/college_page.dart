import 'package:findu_developing_testing/mocks/student_mock.dart';
import 'package:findu_developing_testing/models/college.dart';
import 'package:flutter/material.dart';
import 'package:findu_developing_testing/models/user.dart';
import 'package:findu_developing_testing/models/match.dart';

class CollegePage extends StatelessWidget {
  final College college;

  // Constructor
  const CollegePage({super.key, required this.college});

  @override
  Widget build(BuildContext context) {
    User user = MockUser.fetch(0);

    final int matchScore = calculateMatchScore(user, college);
    return Scaffold(
      appBar: AppBar(
        title: Text(college.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Match Score: $matchScore%",
                style: const TextStyle(fontSize: 24)),
            Text("Name: ${college.name}", style: const TextStyle(fontSize: 24)),
            Text("City: ${college.city}", style: const TextStyle(fontSize: 20)),
            Text("State: ${college.state}",
                style: const TextStyle(fontSize: 20)),
            Text("Admissons Rate: ${college.admissionRateDisplay}"),
            Text("Average SAT score: ${college.averageSATDisplay}"),
            Text("Size of Student Body: ${college.sizeDisplay}"),
          ],
        ),
      ),
    );
  }
}
