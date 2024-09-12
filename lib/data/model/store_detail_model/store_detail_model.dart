import 'package:json_annotation/json_annotation.dart';

part 'store_detail_model.g.dart';

@JsonSerializable()
class StoreDetailModel {
  bool? status;
  String? message;
  Location? location;
  List<StoreList>? stores;

  StoreDetailModel({this.status, this.message, this.location, this.stores});

  factory StoreDetailModel.fromJson(Map<String, dynamic> json) {
    return _$StoreDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StoreDetailModelToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'eng_country')
  String? engCountry;
  @JsonKey(name: 'arb_country')
  String? arbCountry;
  @JsonKey(name: 'eng_governorate')
  String? engGovernorate;
  @JsonKey(name: 'arb_governorate')
  String? arbGovernorate;
  @JsonKey(name: 'eng_city')
  String? engCity;
  @JsonKey(name: 'arb_city')
  String? arbCity;
  @JsonKey(name: 'eng_block')
  String? engBlock;
  @JsonKey(name: 'arb_block')
  String? arbBlock;

  Location({
    this.engCountry,
    this.arbCountry,
    this.engGovernorate,
    this.arbGovernorate,
    this.engCity,
    this.arbCity,
    this.engBlock,
    this.arbBlock,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class StoreList {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'phone')
  String? phone;

  StoreList({this.id, this.engTitle, this.arbTitle, this.image, this.phone});

  factory StoreList.fromJson(Map<String, dynamic> json) =>
      _$StoreListFromJson(json);

  Map<String, dynamic> toJson() => _$StoreListToJson(this);
}
