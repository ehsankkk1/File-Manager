import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utility/enums.dart';
import '../../../../../utility/networking/network_helper.dart';
import '../../../data/data_sources/folder_datasource.dart';
import '../../../data/repositories/folder_repo_impl.dart';
import '../../../domain/use_cases/post_add_folder_usecase.dart';
import '../../../domain/use_cases/post_folder_action_usecase.dart';
part 'folder_new_action_state.dart';
part 'folder_new_action_event.dart';

class FolderActionBloc extends Bloc<FolderActionNewEvent, FolderActionState> {
  FolderActionBloc() : super(FolderActionInitialState()) {
    final FolderRepoImpl folderRepoImpl =
        FolderRepoImpl(FolderDataSource(NetworkHelpers()));

    on<SendFolderActionEvent>((event, emit) async {
      emit(FolderActionLoadingState());

      PostFolderActionUseCase useCase = PostFolderActionUseCase(folderRepoImpl);

      final response = await useCase.call(event);

      emit(FolderActionResponseState(helperResponse: response));
    });
    on<AddFolderEvent>((event, emit) async {
      emit(FolderActionLoadingState());

      PostAddFolderUseCase useCase = PostAddFolderUseCase(folderRepoImpl);

      final response = await useCase.call(event);

      emit(FolderActionResponseState(helperResponse: response));

    });
  }
}
