import 'package:json_annotation/json_annotation.dart';

part 'governerlist.g.dart';

@JsonSerializable()
class Governerlist {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  List<Governorate>? governorate;

  Governerlist({this.status, this.message, this.governorate});

  factory Governerlist.fromJson(Map<String, dynamic> json) {
    return _$GovernerlistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GovernerlistToJson(this);
}

@JsonSerializable()
class Governorate {
  @JsonKey(name: 'id')
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
