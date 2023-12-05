// To parse this JSON data, do
//
//     final fileEntity = fileEntityFromJson(jsonString);

import 'dart:convert';

import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';

import '../../../auth/domain/entities/user_entity.dart';
import 'file_event_entity.dart';

List<FileEntity> fileEntityFromJson(String str) => List<FileEntity>.from(json.decode(str).map((x) => FileEntity.fromJson(x)));

String fileEntityToJson(List<FileEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FileEntity {
  int id;
  String title;
  bool isAvailable;
  String link;
  int userId;
  int folderId;

  int? checkedInUserId;
  User? checkedInUser;
  User user;
  List<FileEventEntity> fileEvent;

  FileEntity({
    this.id = 0,
    this.title = "",
    this.isAvailable = false,
    this.link = "",
    this.userId = 0,
    this.folderId = 0,
    this.checkedInUserId,
    this.checkedInUser,
    required this.user,
    this.fileEvent = const <FileEventEntity>[],
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) => FileEntity(
    id: json["id"]??0,
    title: json["title"]??'',
    isAvailable: json["isAvailable"]??false,
    link: json["link"]??'',
    userId: json["userId"]??0,
    folderId: json["folderId"]??0,
    checkedInUserId: json["checkedInUserId"]??0,
    checkedInUser: json["checkedInUser"]!= null ? User.fromJson(json["checkedInUser"]) : null,
    user: User.fromJson(json["user"]),
    fileEvent: List<FileEventEntity>.from(json["fileEvent"].map((x) => FileEventEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "isAvailable": isAvailable,
    "link": link,
    "userId": userId,
    "folderId": folderId,
    "checkedInUserId": checkedInUserId,
    "checkedInUser": checkedInUser?.toJson(),
    "user": user?.toJson(),
    "fileEvent": List<dynamic>.from(fileEvent.map((x) => x.toJson())),
  };
}
