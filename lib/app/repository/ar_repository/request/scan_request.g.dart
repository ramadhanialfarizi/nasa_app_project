// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanRequest _$ScanRequestFromJson(Map<String, dynamic> json) => ScanRequest(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ScanRequestToJson(ScanRequest instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'timestamp': instance.timestamp,
    };
