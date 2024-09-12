import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
	int? id;
	@JsonKey(name: 'item_id') 
	int? itemId;
	bool? islike;
	bool? isactive;
	@JsonKey(name: 'eng_title') 
	String? engTitle;
	@JsonKey(name: 'arb_title') 
	String? arbTitle;
	String? image;
	String? quantity;
	String? unit;
	String? price;
	String? offerprice;
	int? cartquantity;

	Category({
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

	factory Category.fromJson(Map<String, dynamic> json) {
		return _$CategoryFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
