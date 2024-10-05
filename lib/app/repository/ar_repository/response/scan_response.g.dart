// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanResponse _$ScanResponseFromJson(Map<String, dynamic> json) => ScanResponse(
      Longitude: json['actualPrice'] as double?,
      Latitude: json['date'] as double?,
      PSI: json['PSI'] as double?,
      TOP_5:
          (json['TOP_5'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ScanResponseToJson(ScanResponse instance) =>
    <String, dynamic>{
      'Longitude': instance.Longitude,
      'Latitude': instance.Latitude,
      'PSI': instance.PSI,
      'TOP_5': instance.TOP_5,
    };
