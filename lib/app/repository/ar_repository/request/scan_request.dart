import 'package:json_annotation/json_annotation.dart';

part 'scan_request.g.dart';

@JsonSerializable()
class ScanRequest {
  double? longitude;
  double? latitude;
  String? timestamp;

  ScanRequest({
    this.longitude,
    this.latitude,
    this.timestamp,
  });

  factory ScanRequest.fromJson(Map<String, dynamic> json) =>
      _$ScanRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ScanRequestToJson(this);
}
