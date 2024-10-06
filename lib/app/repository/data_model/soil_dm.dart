import 'package:geolocator/geolocator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'soil_dm.g.dart';

class PositionConverter
    implements JsonConverter<Position?, Map<String, dynamic>> {
  const PositionConverter();

  @override
  Position fromJson(Map<String, dynamic> json) {
    return Position(
      longitude: json['longitude'] as double,
      latitude: json['latitude'] as double,
      timestamp:
          DateTime.parse(json['timestamp'] as String), // Convert to DateTime
      accuracy: (json['accuracy'] ?? 0.0) as double,
      altitude: (json['altitude'] ?? 0.0) as double,
      altitudeAccuracy: (json['altitudeAccuracy'] ?? 0.0) as double,
      heading: (json['heading'] ?? 0.0) as double,
      headingAccuracy: (json['headingAccuracy'] ?? 0.0) as double,
      speed: (json['speed'] ?? 0.0) as double,
      speedAccuracy: (json['speedAccuracy'] ?? 0.0) as double,
    );
  }

  @override
  Map<String, dynamic> toJson(Position? position) => {
        'longitude': position?.longitude,
        'latitude': position?.latitude,
        'timestamp':
            position?.timestamp.toIso8601String(), // Convert DateTime to String
        'accuracy': position?.accuracy,
        'altitude': position?.altitude,
        'altitudeAccuracy': position?.altitudeAccuracy,
        'heading': position?.heading,
        'headingAccuracy': position?.headingAccuracy,
        'speed': position?.speed,
        'speedAccuracy': position?.speedAccuracy,
      };
}

@JsonSerializable()
class SoilDM {
  String? id;
  double? longitude;
  double? latitude;
  double? predictionRF;
  double? predictionSW;
  double? predictionSR;
  double? predictionTemp;
  String? soilWater;
  String? solarRadiation;
  String? precipitation;
  String? temperature;

  @PositionConverter()
  Position? position;

  List<List<dynamic>> thresholdPoints;

  SoilDM({
    this.id = "",
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.predictionRF = 0.0,
    this.predictionSW = 0.0,
    this.predictionSR = 0.0,
    this.predictionTemp = 0.0,
    this.soilWater = "",
    this.solarRadiation = "",
    this.precipitation = "",
    this.temperature = "",
    this.position,
    List<List<dynamic>>? thresholdPoints,
  }) : thresholdPoints = thresholdPoints ??
            [
              ["Mango", 1],
              ["Banana", 1],
              ["Orange", 1],
              ["Papaya", 1],
              ["Pineapple", 1],
            ];

  factory SoilDM.fromJson(Map<String, dynamic> json) => _$SoilDMFromJson(json);
  Map<String, dynamic> toJson() => _$SoilDMToJson(this);
}
