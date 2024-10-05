// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantListResponse _$PlantListResponseFromJson(Map<String, dynamic> json) =>
    PlantListResponse(
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      increasePrecentage: json['increasePrecentage'] as String?,
    );

Map<String, dynamic> _$PlantListResponseToJson(PlantListResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'increasePrecentage': instance.increasePrecentage,
    };
