import 'package:nasa_project/app/repository/market_repository/response/chart_data_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_detail_response.g.dart';

@JsonSerializable()
class MarketDetailResponse {
  String? image;
  String? name;
  String? lowerPrice;
  String? higherPrice;
  String? percentage;
  String? status;
  List<ChartDataList>? chartDataList;

  MarketDetailResponse({
    this.image,
    this.name,
    this.lowerPrice,
    this.higherPrice,
    this.percentage,
    this.status,
    this.chartDataList,
  });

  factory MarketDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDetailResponseToJson(this);
}
