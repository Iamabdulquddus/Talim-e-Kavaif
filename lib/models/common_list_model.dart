import 'dart:convert';

CommonListModel commonListModelFromJson(String str) => CommonListModel.fromJson(json.decode(str));

String commonListModelToJson(CommonListModel data) => json.encode(data.toJson());

class CommonListModel {
  CommonListModel({
    this.id,
    this.userId,
    this.commonActivity,
    this.commonActivityType,
  });

  int? id;
  int? userId;
  String? commonActivity;
  String? commonActivityType;

  factory CommonListModel.fromJson(Map<String, dynamic> json) => CommonListModel(
    id: json["id"],
    userId: json["user_id"],
    commonActivity: json["common_activity"],
    commonActivityType: json["common_activity_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "common_activity": commonActivity,
    "common_activity_type": commonActivityType,
  };
}
