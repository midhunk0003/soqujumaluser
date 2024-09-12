import 'package:json_annotation/json_annotation.dart';

part 'categoeylist_model.g.dart';

@JsonSerializable()
class CategoeylistModel {
	bool? status;
	String? message;
	List<Category>? category;

	CategoeylistModel({this.status, this.message, this.category});

	factory CategoeylistModel.fromJson(Map<String, dynamic> json) {
		return _$CategoeylistModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CategoeylistModelToJson(this);
}



@JsonSerializable()
class Category {
  @JsonKey(name: 'id')
	int? id;
  @JsonKey(name: 'isactive')
	bool? isactive;
	@JsonKey(name: 'eng_title') 
	String? engTitle;
	@JsonKey(name: 'arb_title') 
	String? arbTitle;
  @JsonKey(name: 'image')
	String? image;
  @JsonKey(name: 'productscount')
	int? productscount;

	Category({
		this.id, 
		this.isactive, 
		this.engTitle, 
		this.arbTitle, 
		this.image, 
		this.productscount, 
	});

	factory Category.fromJson(Map<String, dynamic> json) {
		return _$CategoryFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CategoryToJson(this);
}