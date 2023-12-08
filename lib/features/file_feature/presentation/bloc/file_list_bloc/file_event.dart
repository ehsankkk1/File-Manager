part of 'file_bloc.dart';

abstract class FileEvent extends Equatable {
  FileEvent({required this.folderId});

  int folderId;
}

class GetFilesByFolderIdEvent extends FileEvent{
  GetFilesByFolderIdEvent({required int folderId}) : super(folderId: folderId);
  @override
  List<Object?> get props => [folderId];
}
