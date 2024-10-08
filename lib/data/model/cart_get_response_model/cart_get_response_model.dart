import 'package:json_annotation/json_annotation.dart';



part 'cart_get_response_model.g.dart';

@JsonSerializable()
class CartGetResponseModel {
  @JsonKey(name: 'status')
	bool? status;
  @JsonKey(name: 'message')
	String? message;
  @JsonKey(name: 'cart')
	List<Cart>? cart;

	CartGetResponseModel({this.status, this.message, this.cart});

	factory CartGetResponseModel.fromJson(Map<String, dynamic> json) {
		return _$CartGetResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CartGetResponseModelToJson(this);
}


@JsonSerializable()
class Cart {
  @JsonKey(name: 'id')
	int? id;
  @JsonKey(name: 'cartid')
	int? cartid;
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
  @JsonKey(name: 'totalprice')
	double? totalprice;
  @JsonKey(name: 'totalofferprice')
	double? totalofferprice;

	Cart({
		this.id, 
		this.cartid, 
		this.engTitle, 
		this.arbTitle, 
		this.image, 
		this.price, 
		this.offerprice, 
		this.quantity, 
		this.unit, 
		this.cartquantity, 
		this.totalprice, 
		this.totalofferprice, 
	});

	factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

	Map<String, dynamic> toJson() => _$CartToJson(this);
}
