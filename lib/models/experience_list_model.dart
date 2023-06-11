import 'dart:convert';

ExperienceListModel experienceListModelFromJson(String str) => ExperienceListModel.fromJson(json.decode(str));

String experienceListModelToJson(ExperienceListModel data) => json.encode(data.toJson());

class ExperienceListModel {
  ExperienceListModel({
    this.id,
    this.user_id,
    this.company_name,
    this.job_tile,
    this.join_from_year,
    this.end_to_year,
    this.details,
  });

  int? id;
  int? user_id;
  String? company_name;
  String? job_tile;
  String? join_from_year;
  String? end_to_year;
  String? details;




  factory ExperienceListModel.fromJson(Map<String, dynamic> json) => ExperienceListModel(
    id: json["id"],
    user_id: json["user_id"],
    company_name: json["company_name"],
    job_tile: json["job_tile"],
    join_from_year: json["join_from_year"],
    end_to_year: json["end_to_year"],
    details: json["Details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": user_id,
    "company_name": company_name,
    "job_tile": job_tile,
    "join_from_year": join_from_year,
    "end_to_year": end_to_year,
    "Details": details,
  };
}
