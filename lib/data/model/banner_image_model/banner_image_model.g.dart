// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerImageModel _$BannerImageModelFromJson(Map<String, dynamic> json) =>
    BannerImageModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      types: (json['Types'] as List<dynamic>?)
          ?.map((e) => TypeBannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerImageModelToJson(BannerImageModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Types': instance.types,
    };

TypeBannerList _$TypeBannerListFromJson(Map<String, dynamic> json) =>
    TypeBannerList(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$TypeBannerListToJson(TypeBannerList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
