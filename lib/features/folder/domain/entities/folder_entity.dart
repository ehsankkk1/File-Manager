
// To parse this JSON data, do
//
//     final folderEntity = folderEntityFromJson(jsonString);

import 'dart:convert';

List<FolderEntity> folderEntityFromJson(String str) => List<FolderEntity>.from(json.decode(str).map((x) => FolderEntity.fromJson(x)));

String folderEntityToJson(List<FolderEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FolderEntity {
  int id;
  String title;
  int userId;

  FolderEntity({
    this.id = 0,
    this.title = "",
    this.userId = 0,
  });

  factory FolderEntity.fromJson(Map<String, dynamic> json) => FolderEntity(
    id: json["id"]?? 0,
    title: json["title"]??"",
    userId: json["userId"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "userId": userId,
  };
}
