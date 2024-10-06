import 'package:json_annotation/json_annotation.dart';

part 'soil_response.g.dart';

@JsonSerializable()
class SoilResponse {
  String? id;
  double? Longitude;
  double? Latitude;
  double? Prediction_RF;
  double? Prediction_SW;
  double? Prediction_SR;
  double? Prediction_Temp;
  String? Soil_Water;
  String? Solar_Radiation;
  String? Precipitation;
  String? Temperature;
  List<List<dynamic>> Threshold_Points;

  SoilResponse({
    this.id = "",
    this.Longitude = 0.0,
    this.Latitude = 0.0,
    this.Prediction_RF = 0.0,
    this.Prediction_SW = 0.0,
    this.Prediction_SR = 0.0,
    this.Prediction_Temp = 0.0,
    this.Precipitation = "",
    this.Soil_Water = "",
    this.Solar_Radiation = "",
    this.Temperature = "",
    List<List<dynamic>>? Threshold_Points,
  }) : Threshold_Points = Threshold_Points ??
            [
              ["Mango", 1],
              ["Banana", 1],
              ["Orange", 1],
              ["Papaya", 1],
              ["Pineapple", 1],
            ];

  factory SoilResponse.fromJson(Map<String, dynamic> json) =>
      _$SoilResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoilResponseToJson(this);
}
