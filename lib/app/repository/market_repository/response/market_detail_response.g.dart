// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDetailResponse _$MarketDetailResponseFromJson(
        Map<String, dynamic> json) =>
    MarketDetailResponse(
      currencyCode: json['currencyCode'] as String?,
      buyPrice: json['buyPrice'] as String?,
      sellPrice: json['sellPrice'] as String?,
      buyPriceBankNote: json['buyPriceBankNote'] as String?,
      sellPriceBankNote: json['sellPriceBankNote'] as String?,
      chartDataList: (json['chartDataList'] as List<dynamic>?)
          ?.map((e) => ChartDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketDetailResponseToJson(
        MarketDetailResponse instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'buyPrice': instance.buyPrice,
      'sellPrice': instance.sellPrice,
      'buyPriceBankNote': instance.buyPriceBankNote,
      'sellPriceBankNote': instance.sellPriceBankNote,
      'chartDataList': instance.chartDataList,
    };
