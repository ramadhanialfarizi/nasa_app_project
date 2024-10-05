import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';

part 'scan_response.g.dart';

@JsonSerializable()
class ScanResponse {
  String? actualPrice;
  String? date;
  List<PlantListResponse>? plantList;

  ScanResponse({
    this.actualPrice,
    this.date,
    this.plantList,
  });
  factory ScanResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScanResponseToJson(this);
}
