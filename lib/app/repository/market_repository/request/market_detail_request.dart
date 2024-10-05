import 'package:json_annotation/json_annotation.dart';

part 'market_detail_request.g.dart';

@JsonSerializable()
class MarketDetailRequest {
  String? id;

  MarketDetailRequest({
    this.id,
  });

  factory MarketDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$MarketDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDetailRequestToJson(this);
}
