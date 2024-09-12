import 'package:json_annotation/json_annotation.dart';

part 'profile_post_location_model.g.dart';

@JsonSerializable()
class ProfilePostLocationModel {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  Details? details;

  ProfilePostLocationModel({this.status, this.message, this.details});

  factory ProfilePostLocationModel.fromJson(Map<String, dynamic> json) {
    return _$ProfilePostLocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfilePostLocationModelToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  dynamic email;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'governorate')
  String? governorate;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'block')
  String? block;

  Details({
    this.phone,
    this.email,
    this.country,
    this.governorate,
    this.city,
    this.block,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return _$DetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
