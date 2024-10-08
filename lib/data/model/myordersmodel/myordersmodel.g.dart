// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myordersmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Myordersmodel _$MyordersmodelFromJson(Map<String, dynamic> json) =>
    Myordersmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      ordersResp: (json['ordersResp'] as List<dynamic>?)
          ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyordersmodelToJson(Myordersmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'ordersResp': instance.ordersResp,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      id: (json['id'] as num?)?.toInt(),
      isneworder: json['isneworder'] as bool?,
      isactive: json['isactive'] as bool?,
      orderid: (json['orderid'] as num?)?.toInt(),
      isdelivered: json['isdelivered'] as bool?,
      iscancelled: json['iscancelled'] as bool?,
      orderId: json['order_id'] as String?,
      supermarketEng: json['supermarket_eng'] as String?,
      supermarketArb: json['supermarket_arb'] as String?,
      supermarketPhone: json['supermarket_phone'] as String?,
      orderDate: json['order_date'] as String?,
      orderDetails: (json['order_details'] as num?)?.toInt(),
      orderTotalprice: json['order_totalprice'] as String?,
      orderTotalofferprice: json['order_totalofferprice'] as String?,
      deliverby: json['deliverby'],
      address: json['address'] as String?,
      customerid: (json['customerid'] as num?)?.toInt(),
      customername: json['customername'] as String?,
      customerphone: json['customerphone'] as String?,
      zipcode: json['zipcode'] as String?,
      street: json['street'] as String?,
      avenue: json['avenue'] as String?,
      building: json['building'] as String?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
      emirate: json['emirate'] as String?,
      locality: json['locality'] as String?,
      phone: json['phone'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      paymenttype: json['paymenttype'] as String?,
      block: json['block'] == null
          ? null
          : Block.fromJson(json['block'] as Map<String, dynamic>),
      governorate: json['governorate'] == null
          ? null
          : Governorate.fromJson(json['governorate'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isneworder': instance.isneworder,
      'isactive': instance.isactive,
      'orderid': instance.orderid,
      'isdelivered': instance.isdelivered,
      'iscancelled': instance.iscancelled,
      'order_id': instance.orderId,
      'supermarket_eng': instance.supermarketEng,
      'supermarket_arb': instance.supermarketArb,
      'supermarket_phone': instance.supermarketPhone,
      'order_date': instance.orderDate,
      'order_details': instance.orderDetails,
      'order_totalprice': instance.orderTotalprice,
      'order_totalofferprice': instance.orderTotalofferprice,
      'deliverby': instance.deliverby,
      'address': instance.address,
      'customerid': instance.customerid,
      'customername': instance.customername,
      'customerphone': instance.customerphone,
      'zipcode': instance.zipcode,
      'street': instance.street,
      'avenue': instance.avenue,
      'building': instance.building,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'emirate': instance.emirate,
      'locality': instance.locality,
      'phone': instance.phone,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'paymenttype': instance.paymenttype,
      'block': instance.block,
      'governorate': instance.governorate,
      'city': instance.city,
    };

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };

Governorate _$GovernorateFromJson(Map<String, dynamic> json) => Governorate(
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
    );

Map<String, dynamic> _$GovernorateToJson(Governorate instance) =>
    <String, dynamic>{
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
    };
