// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductListModel _$CategoryProductListModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      categoryByProduct: (json['categoryByProduct'] as List<dynamic>?)
          ?.map((e) => CategoryByProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryProductListModelToJson(
        CategoryProductListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'categoryByProduct': instance.categoryByProduct,
      'pagination': instance.pagination,
    };

CategoryByProduct _$CategoryByProductFromJson(Map<String, dynamic> json) =>
    CategoryByProduct(
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

Map<String, dynamic> _$CategoryByProductToJson(CategoryByProduct instance) =>
    <String, dynamic>{
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

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'],
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
    };
