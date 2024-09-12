import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
	int? id;
	int? cartid;
	@JsonKey(name: 'eng_title') 
	String? engTitle;
	@JsonKey(name: 'arb_title') 
	String? arbTitle;
	String? image;
	String? price;
	String? offerprice;
	String? quantity;
	String? unit;
	int? cartquantity;
	double? totalprice;
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
