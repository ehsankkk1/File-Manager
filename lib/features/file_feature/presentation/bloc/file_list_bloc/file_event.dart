part of 'file_bloc.dart';

abstract class FileEvent extends Equatable {
  const FileEvent();
}

class GetFilesByFolderIdEvent extends FileEvent{
  GetFilesByFolderIdEvent({required this.folderId});
  int folderId;
  @override
  List<Object?> get props => [folderId];
}
