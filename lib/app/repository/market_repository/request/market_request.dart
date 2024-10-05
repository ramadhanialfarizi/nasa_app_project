import 'package:json_annotation/json_annotation.dart';

part 'market_request.g.dart';

@JsonSerializable()
class MarketRequest {
  String? date;

  MarketRequest({
    this.date,
  });

  factory MarketRequest.fromJson(Map<String, dynamic> json) =>
      _$MarketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MarketRequestToJson(this);
}
