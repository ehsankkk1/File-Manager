part of 'folder_bloc.dart';

abstract class FolderEvent extends Equatable {
  const FolderEvent();
}

class GetCanAccessFolderEvent extends FolderEvent{

  @override
  List<Object?> get props => [];
}
class GetMyFolderEvent extends FolderEvent{

  @override
  List<Object?> get props => [];
}
