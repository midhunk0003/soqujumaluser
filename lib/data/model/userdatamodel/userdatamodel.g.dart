// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdatamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userdatamodel _$UserdatamodelFromJson(Map<String, dynamic> json) =>
    Userdatamodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserdatamodelToJson(Userdatamodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'],
      phone: json['phone'] as String?,
      address: json['address'],
      emirate: json['emirate'] == null
          ? null
          : Emirate.fromJson(json['emirate'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : Governorate.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      locality: json['locality'],
      zipcode: json['zipcode'],
      street: json['street'],
      avenue: json['avenue'],
      building: json['building'],
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'address': instance.address,
      'emirate': instance.emirate,
      'governorate': instance.governorate,
      'city': instance.city,
      'locality': instance.locality,
      'zipcode': instance.zipcode,
      'street': instance.street,
      'avenue': instance.avenue,
      'building': instance.building,
      'floor': instance.floor,
      'apartment': instance.apartment,
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

Emirate _$EmirateFromJson(Map<String, dynamic> json) => Emirate(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$EmirateToJson(Emirate instance) => <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
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
