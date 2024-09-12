// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num?)?.toInt(),
      cartid: (json['cartid'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      offerprice: json['offerprice'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      cartquantity: (json['cartquantity'] as num?)?.toInt(),
      totalprice: (json['totalprice'] as num?)?.toDouble(),
      totalofferprice: (json['totalofferprice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'cartid': instance.cartid,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'price': instance.price,
      'offerprice': instance.offerprice,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'cartquantity': instance.cartquantity,
      'totalprice': instance.totalprice,
      'totalofferprice': instance.totalofferprice,
    };
