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
class SendCheckInMultipleFilesEvent extends FileActionEvent {
  SendCheckInMultipleFilesEvent(
      {
        required this.folderId,
        required this.fileIds,
      });
  int folderId;
  List<int> fileIds;
  @override
  List<Object?> get props => [ fileIds,folderId];
}
class AddEditFileActionEvent extends FileActionEvent {
  AddEditFileActionEvent(
      {required this.fileEventName,
      required this.folderId,
        this.fileId,
        required this.file,
        required this.title
    });
  FileEventName fileEventName;
  int folderId;
  int? fileId;
  File? file;
  String title;
  @override
  List<Object?> get props => [fileEventName, fileId,folderId,file,title];
}

