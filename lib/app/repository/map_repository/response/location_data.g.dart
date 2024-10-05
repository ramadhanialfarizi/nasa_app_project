// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      lat: json['lat'] as String?,
      code: json['code'] as String?,
      long: json['long'] as String?,
      plants: json['plants'] as String?,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'lat': instance.lat,
      'long': instance.long,
      'plants': instance.plants,
    };
