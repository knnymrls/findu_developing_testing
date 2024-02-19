import 'package:findu_developing_testing/hooks/college_api.dart';
import 'package:findu_developing_testing/pages/college_page.dart';
import 'package:flutter/material.dart';
import 'package:findu_developing_testing/models/college.dart';
import 'package:google_fonts/google_fonts.dart';

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
    if (mounted) {
      setState(() => loading = true);
      // Directly fetching colleges without using Timer for simplicity
      final fetchedColleges = await fetchColleges();
      if (mounted) {
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
              return _renderCollegeListTile(context, college); // Updated call
            },
          );
  }
}

// Updated ListTile rendering function
Widget _renderCollegeListTile(BuildContext context, College college) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.red[400],
      child: Icon(
        Icons.school,
        color: Colors.white,
      ),
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
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => CollegePage(
                  college: college,
                )),
      );
    },
  );
}
