// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetailModel _$StoreDetailModelFromJson(Map<String, dynamic> json) =>
    StoreDetailModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => StoreList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreDetailModelToJson(StoreDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'location': instance.location,
      'stores': instance.stores,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      engCountry: json['eng_country'] as String?,
      arbCountry: json['arb_country'] as String?,
      engGovernorate: json['eng_governorate'] as String?,
      arbGovernorate: json['arb_governorate'] as String?,
      engCity: json['eng_city'] as String?,
      arbCity: json['arb_city'] as String?,
      engBlock: json['eng_block'] as String?,
      arbBlock: json['arb_block'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'eng_country': instance.engCountry,
      'arb_country': instance.arbCountry,
      'eng_governorate': instance.engGovernorate,
      'arb_governorate': instance.arbGovernorate,
      'eng_city': instance.engCity,
      'arb_city': instance.arbCity,
      'eng_block': instance.engBlock,
      'arb_block': instance.arbBlock,
    };

StoreList _$StoreListFromJson(Map<String, dynamic> json) => StoreList(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$StoreListToJson(StoreList instance) => <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'phone': instance.phone,
    };
