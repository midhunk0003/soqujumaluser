import 'package:json_annotation/json_annotation.dart';


part 'city_list_model.g.dart';

@JsonSerializable()
class CityListModel {
  @JsonKey(name: 'status')
	bool? status;
  @JsonKey(name: 'message')
	String? message;
	List<City>? city;

	CityListModel({this.status, this.message, this.city});

	factory CityListModel.fromJson(Map<String, dynamic> json) {
		return _$CityListModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CityListModelToJson(this);
}


@JsonSerializable()
class City {
  @JsonKey(name: 'id')
	int? id;
	@JsonKey(name: 'eng_title') 
	String? engTitle;
	@JsonKey(name: 'arb_title') 
	String? arbTitle;

	City({this.id, this.engTitle, this.arbTitle});

	factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

	Map<String, dynamic> toJson() => _$CityToJson(this);
}
