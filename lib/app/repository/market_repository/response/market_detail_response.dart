import 'package:nasa_project/app/repository/market_repository/response/chart_data_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_detail_response.g.dart';

@JsonSerializable()
class MarketDetailResponse {
  String? currencyCode;
  String? buyPrice;
  String? sellPrice;
  String? buyPriceBankNote;
  String? sellPriceBankNote;
  List<ChartDataList>? chartDataList;

  MarketDetailResponse({
    this.currencyCode,
    this.buyPrice,
    this.sellPrice,
    this.buyPriceBankNote,
    this.sellPriceBankNote,
    this.chartDataList,
  });

  factory MarketDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDetailResponseToJson(this);
}
