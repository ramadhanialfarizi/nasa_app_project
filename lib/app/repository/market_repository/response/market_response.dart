import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_response.g.dart';

@JsonSerializable()
class MarketResponse {
  String? actualPrice;
  String? date;
  List<PlantListResponse>? plantList;

  MarketResponse({
    this.actualPrice,
    this.date,
    this.plantList,
  });
  factory MarketResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketResponseToJson(this);
}
