// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListModel _$CityListModelFromJson(Map<String, dynamic> json) =>
    CityListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      city: (json['city'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListModelToJson(CityListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'city': instance.city,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };
