part of 'folder_users_bloc.dart';

abstract class FolderUsersEvent extends Equatable {
  const FolderUsersEvent();
}
class GetFolderUsersEvent extends FolderUsersEvent{

  GetFolderUsersEvent({required this.folderId});

  int folderId;

  @override
  List<Object?> get props => [folderId];
}