import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_manager/features/auth/domain/entities/user_entity.dart';
import 'package:file_manager/features/folder/domain/use_cases/get_folder_users_usecase.dart';

import '../../../../../utility/networking/network_helper.dart';
import '../../../data/data_sources/folder_datasource.dart';
import '../../../data/repositories/folder_repo_impl.dart';

part 'folder_users_event.dart';
part 'folder_users_state.dart';

class FolderUsersBloc extends Bloc<FolderUsersEvent, FolderUsersState> {
  FolderUsersBloc() : super(FolderUsersInitial()) {
    final FolderRepoImpl folderRepoImpl = FolderRepoImpl(FolderDataSource(NetworkHelpers()));

    on<GetFolderUsersEvent>((event, emit) async {
      emit(FolderUsersInitial());

      GetFolderUsersUsecase usecase = GetFolderUsersUsecase(folderRepoImpl);

      final response = await usecase.call(event);

      if (response is List<User>) {
        emit(FolderUsersDoneState(users: response));
      } else {
        emit(FolderUsersErrorState(helperResponse: response));
      }
    });
  }
}
