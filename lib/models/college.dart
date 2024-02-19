import 'package:json_annotation/json_annotation.dart';

part 'college.g.dart'; // This line is crucial

@JsonSerializable()
class College {
  final String name;
  final String city;
  final String state;

  College({required this.name, required this.city, required this.state});

  // Factory constructor for creating a new `College` instance from a map
  factory College.fromJson(Map<String, dynamic> json) =>
      _$CollegeFromJson(json);

  // `toJson` method to serialize `College` instance to a map
  Map<String, dynamic> toJson() => _$CollegeToJson(this);
}
