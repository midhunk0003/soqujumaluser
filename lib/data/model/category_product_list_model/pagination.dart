import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
	int? count;
	String? next;
	dynamic previous;

	Pagination({this.count, this.next, this.previous});

	factory Pagination.fromJson(Map<String, dynamic> json) {
		return _$PaginationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
