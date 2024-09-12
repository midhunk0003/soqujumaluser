import 'package:json_annotation/json_annotation.dart';

part 'country_list_model.g.dart';

@JsonSerializable()
class CountryListModel {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: 'Country')
  List<Country>? country;

  CountryListModel({this.status, this.message, this.country});

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    return _$CountryListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryListModelToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  Country({this.id, this.engTitle, this.arbTitle});

  factory Country.fromJson(Map<String, dynamic> json) {
    return _$CountryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
