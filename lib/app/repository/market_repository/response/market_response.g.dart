// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketResponse _$MarketResponseFromJson(Map<String, dynamic> json) =>
    MarketResponse(
      actualPrice: json['actualPrice'] as String?,
      date: json['date'] as String?,
      plantList: (json['plantList'] as List<dynamic>?)
          ?.map((e) => PlantListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketResponseToJson(MarketResponse instance) =>
    <String, dynamic>{
      'actualPrice': instance.actualPrice,
      'date': instance.date,
      'plantList': instance.plantList,
    };
