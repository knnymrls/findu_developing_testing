import 'package:flutter/material.dart';
import 'package:findu_developing_testing/models/college.dart'; // Adjust this import path
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

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

class CollegesList extends StatefulWidget {
  @override
  _CollegesListState createState() => _CollegesListState();
}

class _CollegesListState extends State<CollegesList> {
  bool loading = false;
  List<College> colleges = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    if (this.mounted) {
      setState(() => loading = true);
      // Directly fetching colleges without using Timer for simplicity
      final fetchedColleges = await fetchColleges();
      if (this.mounted) {
        setState(() {
          colleges = fetchedColleges;
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: colleges.length,
            itemBuilder: (context, index) {
              final college = colleges[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red[400],
                  child: Icon(
                    Icons.school,
                    color: Colors.white,
                  ), // Display the first letter of the college name
                ),
                title: Text(
                  college.name,
                  style: GoogleFonts.openSans(
                    color: Colors.red[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text('${college.city}, ${college.state}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          college.name,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: Text(
                          '${college.name} is located in ${college.city}, ${college.state}.',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
  }
}
