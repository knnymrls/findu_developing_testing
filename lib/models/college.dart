import 'package:json_annotation/json_annotation.dart';

part 'college.g.dart'; // This line is crucial

@JsonSerializable()
class College {
  final String name;
  final String city;
  final String state;
  final double? admissionRate;
  final int? averageSAT; // Made nullable for demonstration
  final int? size;

  College(
      {required this.name,
      required this.city,
      required this.state,
      this.admissionRate,
      this.averageSAT,
      this.size});

  // Using getters to return a default value if the field is null
  String get admissionRateDisplay => admissionRate?.toString() ?? 'N/A';
  String get averageSATDisplay => averageSAT?.toString() ?? 'N/A';
  String get sizeDisplay => size?.toString() ?? 'N/A';

  factory College.fromJson(Map<String, dynamic> json) =>
      _$CollegeFromJson(json);
  Map<String, dynamic> toJson() => _$CollegeToJson(this);
}
