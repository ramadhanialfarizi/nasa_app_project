// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDetailResponse _$MarketDetailResponseFromJson(
        Map<String, dynamic> json) =>
    MarketDetailResponse(
      image: json['image'] as String?,
      name: json['name'] as String?,
      lowerPrice: json['lowerPrice'] as String?,
      higherPrice: json['higherPrice'] as String?,
      percentage: json['percentage'] as String?,
      status: json['status'] as String?,
      chartDataList: (json['chartDataList'] as List<dynamic>?)
          ?.map((e) => ChartDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketDetailResponseToJson(
        MarketDetailResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'lowerPrice': instance.lowerPrice,
      'higherPrice': instance.higherPrice,
      'percentage': instance.percentage,
      'status': instance.status,
      'chartDataList': instance.chartDataList,
    };
