// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentResponse _$ParentResponseFromJson(Map<String, dynamic> json) =>
    ParentResponse(
      data: json['data'],
      isError: json['isError'] as bool?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as String?,
    );

Map<String, dynamic> _$ParentResponseToJson(ParentResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isError': instance.isError,
      'message': instance.message,
      'data': instance.data,
    };
