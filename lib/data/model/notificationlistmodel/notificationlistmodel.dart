import 'package:json_annotation/json_annotation.dart';

part 'notificationlistmodel.g.dart';

@JsonSerializable()
class Notificationlistmodel {
	bool? status;
	String? message;
	List<dynamic>? notifications;

	Notificationlistmodel({this.status, this.message, this.notifications});

	factory Notificationlistmodel.fromJson(Map<String, dynamic> json) {
		return _$NotificationlistmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NotificationlistmodelToJson(this);
}
