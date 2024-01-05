

import '../../presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';
import '../repositories/folder_repo.dart';

class PostAddFolderUseCase {
  final FolderRepo folderRepo;

  PostAddFolderUseCase(this.folderRepo);

  Future call(AddFolderEvent event) async {
    return await folderRepo.postNewFolderRequestRepo(event);
  }
}