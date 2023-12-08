part of 'file_action_bloc.dart';

abstract class FileActionEvent extends Equatable {
  const FileActionEvent();
}

class SendFileNewActionEvent extends FileActionEvent {
  SendFileNewActionEvent(
      {required this.fileEventName,
      required this.folderId,
      required this.fileId,
    });
  FileEventName fileEventName;
  int folderId;
  int fileId;
  @override
  List<Object?> get props => [fileEventName, fileId,folderId];
}
