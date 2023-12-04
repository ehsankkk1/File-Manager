part of 'file_bloc.dart';

abstract class FileState extends Equatable {
  const FileState();
}

class FileInitial extends FileState {
  @override
  List<Object> get props => [];
}

class FileDoneState extends FileState {
  FileDoneState({required this.files});

  List<FileEntity> files;
  @override
  List<Object> get props => [files];
}

class FileErrorState extends FileState {
  FileErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props =>
      [helperResponse.servicesResponse, helperResponse.response];
}
