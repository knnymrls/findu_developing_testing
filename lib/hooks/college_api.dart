import 'package:findu_developing_testing/models/college.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<College>> fetchColleges() async {
  const String apiUrl = 'https://api.data.gov/ed/collegescorecard/v1/schools';
  const String apiKey = '7sRk3tIechtWteLZA5h22LUceBkUhK9yV8n53MXC';
  final String queryParameters = '?fields=id,school.name,school.city,school.state&api_key=$apiKey';

  final response = await http.get(Uri.parse(apiUrl + queryParameters));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    List<College> colleges = jsonResponse['results'].map<College>((result) {
      return College.fromJson({
        'name': result['school.name'],
        'city': result['school.city'],
        'state': result['school.state'],
      });
    }).toList();

    return colleges;
  } else {
    throw Exception('Failed to load colleges');
  }
}
