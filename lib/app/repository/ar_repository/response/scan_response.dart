// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'scan_response.g.dart';

@JsonSerializable()
class ScanResponse {
  double? Longitude;
  double? Latitude;
  double? PSI;
  List<String>? TOP_5;

  ScanResponse({this.Longitude, this.Latitude, this.PSI, this.TOP_5});
  factory ScanResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScanResponseToJson(this);
}
