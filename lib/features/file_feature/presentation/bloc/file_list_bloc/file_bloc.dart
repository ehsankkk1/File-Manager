import 'package:bloc/bloc.dart';
import '../../../../../utility/networking/network_helper.dart';
import '../../../data/data_sources/file_datasource.dart';
import '../../../data/repositories/file_repo_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/file_entity.dart';
import '../../../domain/use_cases/get_fileByFolderId_usecase.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc() : super(FileInitial()) {

    final FileRepoImpl fileRepoImpl = FileRepoImpl(FileDataSource(NetworkHelpers()));

    on<GetFilesByFolderIdEvent>((event, emit) async {
      emit(FileInitial());

      GetFileByFolderIdUseCase usecase = GetFileByFolderIdUseCase(fileRepoImpl);

      final response = await usecase.call(event);

      if (response is List<FileEntity>) {
        emit(FileDoneState(files: response));
      } else {
        emit(FileErrorState(helperResponse: response));
      }

    });


  }
}
