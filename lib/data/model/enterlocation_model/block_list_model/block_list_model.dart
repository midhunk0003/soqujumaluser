import 'package:json_annotation/json_annotation.dart';

part 'block_list_model.g.dart';

@JsonSerializable()
class BlockListModel {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  List<CityBlock>? city;

  BlockListModel({this.status, this.message, this.city});

  factory BlockListModel.fromJson(Map<String, dynamic> json) {
    return _$BlockListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockListModelToJson(this);
}

@JsonSerializable()
class CityBlock {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;

  CityBlock({this.id, this.engTitle, this.arbTitle});

  factory CityBlock.fromJson(Map<String, dynamic> json) =>
      _$CityBlockFromJson(json);

  Map<String, dynamic> toJson() => _$CityBlockToJson(this);
}
