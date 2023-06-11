import 'dart:convert';

EducationListModel educationListModelFromJson(String str) => EducationListModel.fromJson(json.decode(str));

String educationListModelToJson(EducationListModel data) => json.encode(data.toJson());

class EducationListModel {
  EducationListModel({
    this.gpa_or_marks,
    this.join_from_year,
    this.end_to_year,
    this.uni_or_school,
    this.degree_or_course,
    this.user_id,
    this.id,
  });


  String? gpa_or_marks;
  String? join_from_year;
  String? end_to_year;
  String? uni_or_school;
  String? degree_or_course;
  int? user_id;
  int? id;

  factory EducationListModel.fromJson(Map<String, dynamic> json) => EducationListModel(
    id: json["id"],
    gpa_or_marks: json["gpa_or_marks"],
    join_from_year: json["join_from_year"],
    end_to_year: json["end_to_year"],
    uni_or_school: json["uni_or_school"],
    degree_or_course: json["degree_or_course"],
    user_id: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "join_from_year": join_from_year,
    "end_to_year": end_to_year,
    "uni_or_school": uni_or_school,
    "degree_or_course": degree_or_course,
    "user_id": user_id,
  };
}
