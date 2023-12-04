// To parse this JSON data, do
//
//     final fileEntity = fileEntityFromJson(jsonString);

import 'dart:convert';

List<FileEntity> fileEntityFromJson(String str) => List<FileEntity>.from(json.decode(str).map((x) => FileEntity.fromJson(x)));

String fileEntityToJson(List<FileEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FileEntity {
  int id;
  String title;
  bool isAvailable;
  String link;
  int userId;
  int folderId;

  FileEntity({
    this.id = 0,
    this.title = "",
    this.isAvailable = false,
    this.link = "",
    this.userId = 0,
    this.folderId = 0,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) => FileEntity(
    id: json["id"]??0,
    title: json["title"]??'',
    isAvailable: json["isAvailable"]??false,
    link: json["link"]??'',
    userId: json["userId"]??0,
    folderId: json["folderId"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "isAvailable": isAvailable,
    "link": link,
    "userId": userId,
    "folderId": folderId,
  };
}
