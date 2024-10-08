import 'package:json_annotation/json_annotation.dart';

part 'ordersummarymodel.g.dart';

@JsonSerializable()
class Ordersummarymodel {
  bool? status;
  String? message;
  List<OrderproductSummaryModel>? orderproducts;

  Ordersummarymodel({this.status, this.message, this.orderproducts});

  factory Ordersummarymodel.fromJson(Map<String, dynamic> json) {
    return _$OrdersummarymodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrdersummarymodelToJson(this);
}

@JsonSerializable()
class OrderproductSummaryModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'orderid')
  int? orderid;
  @JsonKey(name: 'item_eng')
  String? itemEng;
  @JsonKey(name: 'item_arb')
  String? itemArb;
  @JsonKey(name: 'unit')
  String? unit;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'amount')
  String? amount;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'mobile')
  String? mobile;

  OrderproductSummaryModel({
    this.id,
    this.orderid,
    this.itemEng,
    this.itemArb,
    this.unit,
    this.quantity,
    this.amount,
    this.image,
    this.mobile,
  });

  factory OrderproductSummaryModel.fromJson(Map<String, dynamic> json) {
    return _$OrderproductSummaryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderproductSummaryModelToJson(this);
}
