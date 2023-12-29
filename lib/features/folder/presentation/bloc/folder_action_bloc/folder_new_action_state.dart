part of 'folder_new_action_bloc.dart';

abstract class FolderActionState extends Equatable {
  const FolderActionState();
}

class FolderActionInitialState extends FolderActionState {
  @override
  List<Object> get props => [];
}

class FolderActionLoadingState extends FolderActionState {
  @override
  List<Object> get props => [];
}

class FolderActionResponseState extends FolderActionState {
  FolderActionResponseState({required this.helperResponse});

  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}
