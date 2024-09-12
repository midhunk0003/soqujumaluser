// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) =>
    CountryListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      country: (json['Country'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListModelToJson(CountryListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Country': instance.country,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };
