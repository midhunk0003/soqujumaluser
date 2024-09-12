// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_get_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartGetResponseModel _$CartGetResponseModelFromJson(
        Map<String, dynamic> json) =>
    CartGetResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartGetResponseModelToJson(
        CartGetResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'cart': instance.cart,
    };
