import 'package:json_annotation/json_annotation.dart';

part 'plant_list_response.g.dart';

@JsonSerializable()
class PlantListResponse {
  String? id;
  String? image;
  String? name;
  String? price;
  String? status;
  String? increasePrecentage;

  PlantListResponse({
    this.id,
    this.image,
    this.name,
    this.price,
    this.status,
    this.increasePrecentage,
  });
  factory PlantListResponse.fromJson(Map<String, dynamic> json) =>
      _$PlantListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlantListResponseToJson(this);
}
