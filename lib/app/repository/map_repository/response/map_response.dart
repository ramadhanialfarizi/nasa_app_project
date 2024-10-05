import 'package:nasa_project/app/repository/map_repository/response/location_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_response.g.dart';

@JsonSerializable()
class MapResponse {
  List<LocationData>? values;

  MapResponse({
    this.values,
  });

  factory MapResponse.fromJson(Map<String, dynamic> json) =>
      _$MapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MapResponseToJson(this);
}
