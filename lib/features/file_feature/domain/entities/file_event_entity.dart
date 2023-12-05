import '../../../../utility/enums.dart';
import '../../../auth/domain/entities/user_entity.dart';

class FileEventEntity {
  int id;
  FileEventName eventName;
  DateTime createdAt;
  int userId;
  int fileId;
  User user;

  FileEventEntity({
    required this.id,
    this.eventName = FileEventName.created,
    required this.userId,
    required this.createdAt,
    required this.fileId,
    required this.user,
  });

  factory FileEventEntity.fromJson(Map<String, dynamic> json) =>
      FileEventEntity(
        id: json["id"],
        eventName:
            eventNameValues.map[json["eventName"]] ?? FileEventName.created,
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        fileId: json["fileId"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "eventName": eventNameValues.reverse[eventName],
        "userId": userId,
        "fileId": fileId,
        "createdAt": createdAt.toIso8601String(),
      };
}
