// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_post_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePostLocationModel _$ProfilePostLocationModelFromJson(
        Map<String, dynamic> json) =>
    ProfilePostLocationModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfilePostLocationModelToJson(
        ProfilePostLocationModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'details': instance.details,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      phone: json['phone'] as String?,
      email: json['email'],
      country: json['country'] as String?,
      governorate: json['governorate'] as String?,
      city: json['city'] as String?,
      block: json['block'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'country': instance.country,
      'governorate': instance.governorate,
      'city': instance.city,
      'block': instance.block,
    };
