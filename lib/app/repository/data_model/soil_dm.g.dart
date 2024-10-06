// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilDM _$SoilDMFromJson(Map<String, dynamic> json) => SoilDM(
      id: json['id'] as String? ?? "",
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      predictionRF: (json['predictionRF'] as num?)?.toDouble() ?? 0.0,
      predictionSW: (json['predictionSW'] as num?)?.toDouble() ?? 0.0,
      predictionSR: (json['predictionSR'] as num?)?.toDouble() ?? 0.0,
      predictionTemp: (json['predictionTemp'] as num?)?.toDouble() ?? 0.0,
      soilWater: json['soilWater'] as String? ?? "",
      solarRadiation: json['solarRadiation'] as String? ?? "",
      precipitation: json['precipitation'] as String? ?? "",
      temperature: json['temperature'] as String? ?? "",
      position: _$JsonConverterFromJson<Map<String, dynamic>, Position?>(
          json['position'], const PositionConverter().fromJson),
      thresholdPoints: (json['thresholdPoints'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SoilDMToJson(SoilDM instance) => <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'predictionRF': instance.predictionRF,
      'predictionSW': instance.predictionSW,
      'predictionSR': instance.predictionSR,
      'predictionTemp': instance.predictionTemp,
      'soilWater': instance.soilWater,
      'solarRadiation': instance.solarRadiation,
      'precipitation': instance.precipitation,
      'temperature': instance.temperature,
      'position': const PositionConverter().toJson(instance.position),
      'thresholdPoints': instance.thresholdPoints,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
