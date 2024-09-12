import 'package:json_annotation/json_annotation.dart';

part 'liked_product_model.g.dart';

@JsonSerializable()
class LikedProductModel {
  bool? status;
  String? message;
  List<LikedProduct>? likedProduct;

  LikedProductModel({this.status, this.message, this.likedProduct});

  factory LikedProductModel.fromJson(Map<String, dynamic> json) {
    return _$LikedProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LikedProductModelToJson(this);
}

@JsonSerializable()
class LikedProduct {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'offerprice')
  String? offerprice;
  @JsonKey(name: 'quantity')
  String? quantity;
  @JsonKey(name: 'unit')
  String? unit;
  @JsonKey(name: 'cartquantity')
  int? cartquantity;

  LikedProduct({
    this.id,
    this.engTitle,
    this.arbTitle,
    this.image,
    this.price,
    this.offerprice,
    this.quantity,
    this.unit,
    this.cartquantity,
  });

  factory LikedProduct.fromJson(Map<String, dynamic> json) {
    return _$LikedProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LikedProductToJson(this);
}
