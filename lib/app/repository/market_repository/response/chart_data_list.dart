import 'package:nasa_project/app/repository/market_repository/response/list_chart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chart_data_list.g.dart';

@JsonSerializable()
class ChartDataList {
  String? timePeriod;
  String? highest;
  String? lowest;
  String? average;
  List<ListChart>? chartData;

  ChartDataList({
    this.timePeriod,
    this.highest,
    this.lowest,
    this.average,
    this.chartData,
  });

  factory ChartDataList.fromJson(Map<String, dynamic> json) =>
      _$ChartDataListFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataListToJson(this);
}
