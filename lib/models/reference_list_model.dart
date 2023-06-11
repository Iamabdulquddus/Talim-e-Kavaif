// To parse this JSON data, do
//
//     final referenceListModel = referenceListModelFromJson(jsonString);

import 'dart:convert';

ReferenceListModel referenceListModelFromJson(String str) => ReferenceListModel.fromJson(json.decode(str));

String referenceListModelToJson(ReferenceListModel data) => json.encode(data.toJson());

class ReferenceListModel {
  ReferenceListModel({
    this.id,
    this.userId,
    this.referenceName,
    this.referenceJobTitle,
    this.referenceCompanyName,
    this.referenceEmail,
    this.referencePhoneNo,
  });

  int? id;
  int? userId;
  String? referenceName;
  String? referenceJobTitle;
  String? referenceCompanyName;
  String? referenceEmail;
  String? referencePhoneNo;

  factory ReferenceListModel.fromJson(Map<String, dynamic> json) => ReferenceListModel(
    id: json["id"],
    userId: json["user_id"],
    referenceName: json["reference_name"],
    referenceJobTitle: json["reference_job_title"],
    referenceCompanyName: json["reference_company_name"],
    referenceEmail: json["reference_email"],
    referencePhoneNo: json["reference_phone_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "reference_name": referenceName,
    "reference_job_title": referenceJobTitle,
    "reference_company_name": referenceCompanyName,
    "reference_email": referenceEmail,
    "reference_phone_no": referencePhoneNo,
  };
}
