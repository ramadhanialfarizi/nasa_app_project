// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapResponse _$MapResponseFromJson(Map<String, dynamic> json) => MapResponse(
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MapResponseToJson(MapResponse instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
