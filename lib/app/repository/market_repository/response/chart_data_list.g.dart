// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartDataList _$ChartDataListFromJson(Map<String, dynamic> json) =>
    ChartDataList(
      timePeriod: json['timePeriod'] as String?,
      highest: json['highest'] as String?,
      lowest: json['lowest'] as String?,
      average: json['average'] as String?,
      chartData: (json['chartData'] as List<dynamic>?)
          ?.map((e) => ListChart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChartDataListToJson(ChartDataList instance) =>
    <String, dynamic>{
      'timePeriod': instance.timePeriod,
      'highest': instance.highest,
      'lowest': instance.lowest,
      'average': instance.average,
      'chartData': instance.chartData,
    };
