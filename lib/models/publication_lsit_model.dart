import 'dart:convert';

PublicationListModel publicationListModelFromJson(String str) => PublicationListModel.fromJson(json.decode(str));

String publicationListModelToJson(PublicationListModel data) => json.encode(data.toJson());

class PublicationListModel {
  PublicationListModel({
    this.id,
    this.userId,
    this.publicationTitle,
    this.publicationDetail,
  });

  int? id;
  int? userId;
  String? publicationTitle;
  String? publicationDetail;

  factory PublicationListModel.fromJson(Map<String, dynamic> json) => PublicationListModel(
    id: json["id"],
    userId: json["user_id"],
    publicationTitle: json["publication_title"],
    publicationDetail: json["publication_detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "publication_title": publicationTitle,
    "publication_detail": publicationDetail,
  };
}
