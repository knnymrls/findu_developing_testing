// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

College _$CollegeFromJson(Map<String, dynamic> json) => College(
      name: json['name'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      admissionRate: (json['admissionRate'] as num?)?.toDouble(),
      averageSAT: json['averageSAT'] as int?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$CollegeToJson(College instance) => <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'admissionRate': instance.admissionRate,
      'averageSAT': instance.averageSAT,
      'size': instance.size,
    };
