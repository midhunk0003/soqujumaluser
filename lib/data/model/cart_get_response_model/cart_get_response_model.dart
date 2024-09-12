import 'package:json_annotation/json_annotation.dart';

import 'cart.dart';

part 'cart_get_response_model.g.dart';

@JsonSerializable()
class CartGetResponseModel {
	bool? status;
	String? message;
	List<Cart>? cart;

	CartGetResponseModel({this.status, this.message, this.cart});

	factory CartGetResponseModel.fromJson(Map<String, dynamic> json) {
		return _$CartGetResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CartGetResponseModelToJson(this);
}
