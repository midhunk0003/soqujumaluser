// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governerlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Governerlist _$GovernerlistFromJson(Map<String, dynamic> json) => Governerlist(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      governorate: (json['governorate'] as List<dynamic>?)
          ?.map((e) => Governorate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GovernerlistToJson(Governerlist instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'governorate': instance.governorate,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };
