import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_manager/features/file_feature/domain/use_cases/add_edit_file_usecase.dart';
import 'package:file_manager/utility/enums.dart';
import 'package:file_manager/utility/networking/network_helper.dart';

import '../../../data/data_sources/file_datasource.dart';
import '../../../data/repositories/file_repo_impl.dart';
import '../../../domain/use_cases/file_action_usecase.dart';

part 'file_action_event.dart';
part 'file_action_state.dart';

class FileActionBloc extends Bloc<FileActionEvent, FileActionState> {
  FileActionBloc() : super(FileActionInitialState()) {
    final FileRepoImpl fileRepoImpl =
        FileRepoImpl(FileDataSource(NetworkHelpers()));

    on<SendFileNewActionEvent>((event, emit) async {
      emit(FileActionLoadingState());

      PostFileActionUseCase useCase = PostFileActionUseCase(fileRepoImpl);

      final response = await useCase.call(event);

      emit(FileActionResponseState(helperResponse: response));
    });
    on<AddEditFileActionEvent>((event, emit) async {
      emit(FileActionLoadingState());

      AddEditFileUseCase useCase = AddEditFileUseCase(fileRepoImpl);

      final response = await useCase.call(event);

      emit(FileActionResponseState(helperResponse: response));
    });
  }
}
