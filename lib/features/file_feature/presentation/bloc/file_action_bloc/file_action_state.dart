part of 'file_action_bloc.dart';

abstract class FileActionState extends Equatable {
  const FileActionState();
}

class FileActionInitialState extends FileActionState {
  @override
  List<Object> get props => [];
}

class FileActionLoadingState extends FileActionState {
  @override
  List<Object> get props => [];
}

class FileActionResponseState extends FileActionState {
  FileActionResponseState({required this.helperResponse});

  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}
