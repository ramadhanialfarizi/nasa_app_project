// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantListResponse _$PlantListResponseFromJson(Map<String, dynamic> json) =>
    PlantListResponse(
      id: json['id'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      status: json['status'] as String?,
      increasePrecentage: json['increasePrecentage'] as String?,
    );

Map<String, dynamic> _$PlantListResponseToJson(PlantListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'increasePrecentage': instance.increasePrecentage,
    };
