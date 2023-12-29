import 'package:file_manager/features/folder/domain/repositories/folder_repo.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';

import '../../presentation/bloc/folder_users_bloc/folder_users_bloc.dart';

class GetFolderUsersUsecase {
  final FolderRepo folderRepo;

  GetFolderUsersUsecase(this.folderRepo);

  Future call(GetFolderUsersEvent getFolderUsersEvent) async {
    return await folderRepo.getFolderUsers(getFolderUsersEvent);
  }
}
