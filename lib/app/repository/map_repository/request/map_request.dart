import 'package:json_annotation/json_annotation.dart';

part 'map_request.g.dart';

@JsonSerializable()
class MapRequest {
  String? lat;
  String? long;

  MapRequest({
    this.lat,
    this.long,
  });

  factory MapRequest.fromJson(Map<String, dynamic> json) =>
      _$MapRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MapRequestToJson(this);
}
