import 'package:json_annotation/json_annotation.dart';

part 'category_product_list_model.g.dart';

@JsonSerializable()
class CategoryProductListModel {
  bool? status;
  String? message;
  List<CategoryByProduct>? categoryByProduct;
  Pagination? pagination;

  CategoryProductListModel({
    this.status,
    this.message,
    this.categoryByProduct,
    this.pagination,
  });

  factory CategoryProductListModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryProductListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryProductListModelToJson(this);
}

@JsonSerializable()
class CategoryByProduct {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'islike')
  bool? islike;
  @JsonKey(name: 'isactive')
  bool? isactive;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'quantity')
  String? quantity;
  @JsonKey(name: 'unit')
  String? unit;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'offerprice')
  String? offerprice;
  @JsonKey(name: 'cartquantity')
  int? cartquantity;

  CategoryByProduct({
    this.id,
    this.itemId,
    this.islike,
    this.isactive,
    this.engTitle,
    this.arbTitle,
    this.image,
    this.quantity,
    this.unit,
    this.price,
    this.offerprice,
    this.cartquantity,
  });

  factory CategoryByProduct.fromJson(Map<String, dynamic> json) {
    return _$CategoryByProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryByProductToJson(this);
}

@JsonSerializable()
class Pagination {
  int? count;
  String? next;
  dynamic previous;

  Pagination({this.count, this.next, this.previous});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
