// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanResponse _$ScanResponseFromJson(Map<String, dynamic> json) => ScanResponse(
      Longitude: (json['Longitude'] as num?)?.toDouble(),
      Latitude: (json['Latitude'] as num?)?.toDouble(),
      PSI: (json['PSI'] as num?)?.toDouble(),
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
