import 'package:json_annotation/json_annotation.dart';

part 'list_chart.g.dart';

@JsonSerializable()
class ListChart {
  String? timeMarker;
  String? value;

  ListChart({
    this.timeMarker,
    this.value,
  });

  factory ListChart.fromJson(Map<String, dynamic> json) =>
      _$ListChartFromJson(json);

  Map<String, dynamic> toJson() => _$ListChartToJson(this);
}
