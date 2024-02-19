import 'package:flutter/material.dart';
import 'package:findu_developing_testing/models/college.dart'; // Adjust this import path
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:findu_developing_testing/college_list.dart';

import 'hooks/college_api.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Colleges List',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: CollegesList(), // Your widget that contains the ListView
      ),
    );
  }
}
