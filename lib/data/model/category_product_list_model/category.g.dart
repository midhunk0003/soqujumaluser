// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      islike: json['islike'] as bool?,
      isactive: json['isactive'] as bool?,
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      price: json['price'] as String?,
      offerprice: json['offerprice'] as String?,
      cartquantity: (json['cartquantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'islike': instance.islike,
      'isactive': instance.isactive,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'offerprice': instance.offerprice,
      'cartquantity': instance.cartquantity,
    };
