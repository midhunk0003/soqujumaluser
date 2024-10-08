// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationlistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notificationlistmodel _$NotificationlistmodelFromJson(
        Map<String, dynamic> json) =>
    Notificationlistmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      notifications: json['notifications'] as List<dynamic>?,
    );

Map<String, dynamic> _$NotificationlistmodelToJson(
        Notificationlistmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'notifications': instance.notifications,
    };
