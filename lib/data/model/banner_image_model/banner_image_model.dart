import 'package:json_annotation/json_annotation.dart';

part 'banner_image_model.g.dart';

@JsonSerializable()
class BannerImageModel {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'Types')
  List<TypeBannerList>? types;

  BannerImageModel({this.status, this.message, this.types});

  factory BannerImageModel.fromJson(Map<String, dynamic> json) {
    return _$BannerImageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerImageModelToJson(this);
}

@JsonSerializable()
class TypeBannerList {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;

  TypeBannerList({this.id, this.image});

  factory TypeBannerList.fromJson(Map<String, dynamic> json) => _$TypeBannerListFromJson(json);

  Map<String, dynamic> toJson() => _$TypeBannerListToJson(this);
}
