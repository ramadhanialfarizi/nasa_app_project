import 'package:json_annotation/json_annotation.dart';

part 'parent_response.g.dart';

@JsonSerializable()
class ParentResponse {
  String? statusCode;
  bool? isError;
  String? message;
  dynamic data;

  ParentResponse({
    this.data,
    this.isError,
    this.message,
    this.statusCode,
  });

  factory ParentResponse.fromJson(Map<String, dynamic> json) =>
      _$ParentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ParentResponseToJson(this);
}
