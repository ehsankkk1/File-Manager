part of 'folder_new_action_bloc.dart';

abstract class FolderActionNewEvent extends Equatable {
  const FolderActionNewEvent();
}

class SendFolderActionEvent extends FolderActionNewEvent {
  SendFolderActionEvent({
    required this.folderEventName,
    required this.folderId,
    this.userId,
    this.email,
  });
  FolderEventName folderEventName;
  int folderId;
  int? userId;
  String? email;
  @override
  List<Object?> get props => [folderEventName, folderId, userId, email];
}

class AddFolderEvent extends FolderActionNewEvent {
  AddFolderEvent({required this.title});
  String title;
  @override
  List<Object?> get props => [title];
}
