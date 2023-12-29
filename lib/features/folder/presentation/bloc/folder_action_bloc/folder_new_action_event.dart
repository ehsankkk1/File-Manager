part of 'folder_new_action_bloc.dart';

abstract class FolderActionNewEvent extends Equatable {
  const FolderActionNewEvent();
}

class SendFolderActionEvent extends FolderActionNewEvent {
  SendFolderActionEvent({
    required this.folderEventName,
    required this.folderId,
    required this.userId,
    this.email,
  });
  FolderEventName folderEventName;
  int folderId;
  int? userId;
  String? email;
  @override
  List<Object?> get props => [folderEventName, folderId, userId,email];
}

class AddFolderActionEvent extends FolderActionNewEvent {
  AddFolderActionEvent(
      {required this.folderEventName, required this.title});
  FolderEventName folderEventName;
  String title;
  @override
  List<Object?> get props => [folderEventName, title];
}
