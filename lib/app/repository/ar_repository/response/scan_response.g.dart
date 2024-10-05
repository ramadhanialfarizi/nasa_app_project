// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanResponse _$ScanResponseFromJson(Map<String, dynamic> json) => ScanResponse(
      actualPrice: json['actualPrice'] as String?,
      date: json['date'] as String?,
      plantList: (json['plantList'] as List<dynamic>?)
          ?.map((e) => PlantListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScanResponseToJson(ScanResponse instance) =>
    <String, dynamic>{
      'actualPrice': instance.actualPrice,
      'date': instance.date,
      'plantList': instance.plantList,
    };
