import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_manager/features/folder/data/data_sources/folder_datasource.dart';
import 'package:file_manager/features/folder/data/repositories/folder_repo_impl.dart';
import 'package:file_manager/features/folder/domain/use_cases/get_canAccess_folder_usecase.dart';
import '../../../../utility/networking/network_helper.dart';
import '../../domain/entities/folder_entity.dart';

part 'folder_event.dart';
part 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  FolderBloc() : super(FolderInitial()) {

    final FolderRepoImpl folderRepoImpl = FolderRepoImpl(FolderDataSource(NetworkHelpers()));

    on<GetCanAccessFolderEvent>((event, emit) async {
      emit(FolderInitial());

      GetCanAccessFolderUsecase usecase = GetCanAccessFolderUsecase(folderRepoImpl);
      final response = await usecase.call(event);

      if (response is List<FolderEntity>) {
        emit(FolderDoneState(folders: response));
      } else {
        emit(FolderErrorState(helperResponse: response));
      }

    });


  }
}
