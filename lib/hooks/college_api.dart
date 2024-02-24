import 'package:findu_developing_testing/models/college.dart';
import 'package:findu_developing_testing/models/match.dart';
import 'package:findu_developing_testing/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = 'https://api.data.gov/ed/collegescorecard/v1/schools';
const String apiKey = '7sRk3tIechtWteLZA5h22LUceBkUhK9yV8n53MXC';
const String queryParameters =
    '?api_key=$apiKey&fields=id,school.name,school.city,school.state,latest.admissions.admission_rate.overall,latest.admissions.sat_scores.average.overall,latest.student.size&page=0&per_page=100';

Future<List<College>> fetchAllColleges(User user) async {
  List<College> allColleges = [];
  int page = 0;

  while (true) {
    try {
      final response =
          await http.get(Uri.parse('$apiUrl$queryParameters&page=$page'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        List<College> colleges = jsonResponse['results'].map<College>((result) {
          College college = College.fromJson({
            'name': result['school.name'],
            'city': result['school.city'],
            'state': result['school.state'],
            'admissionRate': result['latest.admissions.admission_rate.overall'],
            'averageSAT':
                result['latest.admissions.sat_scores.average.overall'],
            'size': result['latest.student.size'],
          });

          // Calculate match score for each college
          college.matchScore = calculateMatchScore(user, college);

          return college;
        }).toList();

        if (page == 10) {
          break;
        }

        allColleges.addAll(colleges);
        page++;
      } else {
        throw Exception('Failed to load colleges');
      }
    } catch (e) {
      throw Exception('Failed to fetch colleges: $e');
    }
  }

  // Sort the colleges by match score
  allColleges.sort((a, b) => (b.matchScore ?? 0).compareTo(a.matchScore ?? 0));

  return allColleges;
}
