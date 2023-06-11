// To parse this JSON data, do
//
//     final projectListModel = projectListModelFromJson(jsonString);

import 'dart:convert';

ProjectListModel projectListModelFromJson(String str) => ProjectListModel.fromJson(json.decode(str));

String projectListModelToJson(ProjectListModel data) => json.encode(data.toJson());

class ProjectListModel {
  ProjectListModel({
    this.id,
    this.userId,
    this.userProjectTitle,
    this.userProjectDetail,
  });

  int? id;
  int? userId;
  String? userProjectTitle;
  String? userProjectDetail;

  factory ProjectListModel.fromJson(Map<String, dynamic> json) => ProjectListModel(
    id: json["id"],
    userId: json["user_id"],
    userProjectTitle: json["user_project_title"],
    userProjectDetail: json["user_project_detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_project_title": userProjectTitle,
    "user_project_detail": userProjectDetail,
  };
}
