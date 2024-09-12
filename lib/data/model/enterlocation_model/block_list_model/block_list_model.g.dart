// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockListModel _$BlockListModelFromJson(Map<String, dynamic> json) =>
    BlockListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      city: (json['city'] as List<dynamic>?)
          ?.map((e) => CityBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockListModelToJson(BlockListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'city': instance.city,
    };

CityBlock _$CityBlockFromJson(Map<String, dynamic> json) => CityBlock(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$CityBlockToJson(CityBlock instance) => <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };
