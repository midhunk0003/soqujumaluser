// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikedProductModel _$LikedProductModelFromJson(Map<String, dynamic> json) =>
    LikedProductModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      likedProduct: (json['likedProduct'] as List<dynamic>?)
          ?.map((e) => LikedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LikedProductModelToJson(LikedProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'likedProduct': instance.likedProduct,
    };

LikedProduct _$LikedProductFromJson(Map<String, dynamic> json) => LikedProduct(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      offerprice: json['offerprice'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      cartquantity: (json['cartquantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LikedProductToJson(LikedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'price': instance.price,
      'offerprice': instance.offerprice,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'cartquantity': instance.cartquantity,
    };
