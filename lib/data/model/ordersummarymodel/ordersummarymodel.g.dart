// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordersummarymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ordersummarymodel _$OrdersummarymodelFromJson(Map<String, dynamic> json) =>
    Ordersummarymodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      orderproducts: (json['orderproducts'] as List<dynamic>?)
          ?.map((e) =>
              OrderproductSummaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersummarymodelToJson(Ordersummarymodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'orderproducts': instance.orderproducts,
    };

OrderproductSummaryModel _$OrderproductSummaryModelFromJson(
        Map<String, dynamic> json) =>
    OrderproductSummaryModel(
      id: (json['id'] as num?)?.toInt(),
      orderid: (json['orderid'] as num?)?.toInt(),
      itemEng: json['item_eng'] as String?,
      itemArb: json['item_arb'] as String?,
      unit: json['unit'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      amount: json['amount'] as String?,
      image: json['image'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$OrderproductSummaryModelToJson(
        OrderproductSummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderid': instance.orderid,
      'item_eng': instance.itemEng,
      'item_arb': instance.itemArb,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'image': instance.image,
      'mobile': instance.mobile,
    };
