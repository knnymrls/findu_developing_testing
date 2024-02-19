import 'package:json_annotation/json_annotation.dart';

part 'college.g.dart'; // This line is crucial

@JsonSerializable()
class College {
  final String name;
  final String city;
  final String state;

  College({
    required this.name,
    required this.city,
    required this.state,
  });

  factory College.fromJson(Map<String, dynamic> json) =>
      _$CollegeFromJson(json);
  Map<String, dynamic> toJson() => _$CollegeToJson(this);
}
