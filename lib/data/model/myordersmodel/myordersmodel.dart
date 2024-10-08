import 'package:json_annotation/json_annotation.dart';

part 'myordersmodel.g.dart';

@JsonSerializable()
class Myordersmodel {
  bool? status;
  String? message;
  List<OrderResponse>? ordersResp;

  Myordersmodel({this.status, this.message, this.ordersResp});

  factory Myordersmodel.fromJson(Map<String, dynamic> json) {
    return _$MyordersmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyordersmodelToJson(this);
}

@JsonSerializable()
class OrderResponse {
  int? id;
  bool? isneworder;
  bool? isactive;
  int? orderid;
  bool? isdelivered;
  bool? iscancelled;
  @JsonKey(name: 'order_id')
  String? orderId;
  @JsonKey(name: 'supermarket_eng')
  String? supermarketEng;
  @JsonKey(name: 'supermarket_arb')
  String? supermarketArb;
  @JsonKey(name: 'supermarket_phone')
  String? supermarketPhone;
  @JsonKey(name: 'order_date')
  String? orderDate;
  @JsonKey(name: 'order_details')
  int? orderDetails;
  @JsonKey(name: 'order_totalprice')
  String? orderTotalprice;
  @JsonKey(name: 'order_totalofferprice')
  String? orderTotalofferprice;
  dynamic deliverby;
  String? address;
  int? customerid;
  String? customername;
  String? customerphone;
  String? zipcode;
  String? street;
  String? avenue;
  String? building;
  String? floor;
  String? apartment;
  String? emirate;
  String? locality;
  String? phone;
  String? firstname;
  String? lastname;
  String? paymenttype;
  Block? block;
  Governorate? governorate;
  City? city;

  OrderResponse({
    this.id,
    this.isneworder,
    this.isactive,
    this.orderid,
    this.isdelivered,
    this.iscancelled,
    this.orderId,
    this.supermarketEng,
    this.supermarketArb,
    this.supermarketPhone,
    this.orderDate,
    this.orderDetails,
    this.orderTotalprice,
    this.orderTotalofferprice,
    this.deliverby,
    this.address,
    this.customerid,
    this.customername,
    this.customerphone,
    this.zipcode,
    this.street,
    this.avenue,
    this.building,
    this.floor,
    this.apartment,
    this.emirate,
    this.locality,
    this.phone,
    this.firstname,
    this.lastname,
    this.paymenttype,
    this.block,
    this.governorate,
    this.city,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class Block {
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  Block({this.engTitle, this.arbTitle});

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  Map<String, dynamic> toJson() => _$BlockToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  City({this.engTitle, this.arbTitle});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Governorate {
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  Governorate({this.engTitle, this.arbTitle});

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return _$GovernorateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}
