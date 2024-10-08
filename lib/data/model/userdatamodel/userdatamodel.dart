import 'package:json_annotation/json_annotation.dart';

part 'userdatamodel.g.dart';

@JsonSerializable()
class Userdatamodel {
  bool? status;
  String? message;
  UserData? data;

  Userdatamodel({this.status, this.message, this.data});

  factory Userdatamodel.fromJson(Map<String, dynamic> json) {
    return _$UserdatamodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserdatamodelToJson(this);
}

@JsonSerializable()
class UserData {
  String? firstname;
  dynamic lastname;
  String? phone;
  dynamic address;
  Emirate? emirate;
  Governorate? governorate;
  City? city;
  dynamic locality;
  dynamic zipcode;
  dynamic street;
  dynamic avenue;
  dynamic building;
  String? floor;
  String? apartment;

  UserData({
    this.firstname,
    this.lastname,
    this.phone,
    this.address,
    this.emirate,
    this.governorate,
    this.city,
    this.locality,
    this.zipcode,
    this.street,
    this.avenue,
    this.building,
    this.floor,
    this.apartment,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class City {
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  City({this.id, this.engTitle, this.arbTitle});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Emirate {
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  Emirate({this.id, this.engTitle, this.arbTitle});

  factory Emirate.fromJson(Map<String, dynamic> json) {
    return _$EmirateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmirateToJson(this);
}

@JsonSerializable()
class Governorate {
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  Governorate({this.id, this.engTitle, this.arbTitle});

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return _$GovernorateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GovernorateToJson(this);
}
