// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoeylist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoeylistModel _$CategoeylistModelFromJson(Map<String, dynamic> json) =>
    CategoeylistModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoeylistModelToJson(CategoeylistModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      isactive: json['isactive'] as bool?,
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      productscount: (json['productscount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'isactive': instance.isactive,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'productscount': instance.productscount,
    };
