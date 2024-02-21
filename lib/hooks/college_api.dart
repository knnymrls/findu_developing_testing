import 'package:findu_developing_testing/models/college.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<College>> fetchColleges() async {
  const String apiUrl = 'https://api.data.gov/ed/collegescorecard/v1/schools';
  const String apiKey = '7sRk3tIechtWteLZA5h22LUceBkUhK9yV8n53MXC';
  const String queryParameters =
      '?api_key=$apiKey&fields=id,school.name,school.city,school.state,latest.admissions.admission_rate.overall,latest.admissions.sat_scores.average.overall,latest.student.size';

  final response = await http.get(Uri.parse(apiUrl + queryParameters));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    // Assuming jsonResponse is the decoded JSON response from the API
    List<College> colleges = jsonResponse['results'].map<College>((result) {
      return College.fromJson({
        'name': result['school.name'],
        'city': result['school.city'],
        'state': result['school.state'],
        'admissionRate': result['latest.admissions.admission_rate.overall'],
        'averageSAT': result['latest.admissions.sat_scores.average.overall'],
        'size': result['latest.student.size'],
      });
    }).toList();
    return colleges;
  } else {
    throw Exception('Failed to load colleges');
  }
}
