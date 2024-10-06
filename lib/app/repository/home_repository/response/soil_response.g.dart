// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilResponse _$SoilResponseFromJson(Map<String, dynamic> json) => SoilResponse(
      id: json['id'] as String? ?? "",
      Longitude: (json['Longitude'] as num?)?.toDouble() ?? 0.0,
      Latitude: (json['Latitude'] as num?)?.toDouble() ?? 0.0,
      Prediction_RF: (json['Prediction_RF'] as num?)?.toDouble() ?? 0.0,
      Prediction_SW: (json['Prediction_SW'] as num?)?.toDouble() ?? 0.0,
      Prediction_SR: (json['Prediction_SR'] as num?)?.toDouble() ?? 0.0,
      Prediction_Temp: (json['Prediction_Temp'] as num?)?.toDouble() ?? 0.0,
      Precipitation: json['Precipitation'] as String? ?? "",
      Soil_Water: json['Soil_Water'] as String? ?? "",
      Solar_Radiation: json['Solar_Radiation'] as String? ?? "",
      Temperature: json['Temperature'] as String? ?? "",
      Threshold_Points: (json['Threshold_Points'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SoilResponseToJson(SoilResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Longitude': instance.Longitude,
      'Latitude': instance.Latitude,
      'Prediction_RF': instance.Prediction_RF,
      'Prediction_SW': instance.Prediction_SW,
      'Prediction_SR': instance.Prediction_SR,
      'Prediction_Temp': instance.Prediction_Temp,
      'Soil_Water': instance.Soil_Water,
      'Solar_Radiation': instance.Solar_Radiation,
      'Precipitation': instance.Precipitation,
      'Temperature': instance.Temperature,
      'Threshold_Points': instance.Threshold_Points,
    };
