part of 'folder_bloc.dart';

abstract class FolderState extends Equatable {
  const FolderState();
}

class FolderInitial extends FolderState {
  @override
  List<Object> get props => [];
}

class FolderDoneState extends FolderState {
  FolderDoneState({required this.folders});

  List<FolderEntity> folders;
  @override
  List<Object> get props => [folders];
}

class FolderErrorState extends FolderState {
  FolderErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props =>
      [helperResponse.servicesResponse, helperResponse.response];
}
