
import '../../../../utility/enums.dart';
import '../../presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';
import '../repositories/folder_repo.dart';

class PostFolderActionUseCase {
  final FolderRepo folderRepo;

  PostFolderActionUseCase(this.folderRepo);

  Future call(SendFolderActionEvent event) async {
    if(event.folderEventName == FolderEventName.remove){
      return await folderRepo.removeUserFolderDeleteRequestRepo(event);
    }
    if(event.folderEventName == FolderEventName.add){
      return await folderRepo.addUserFolderPostRequestRepo(event);
    }
    if(event.folderEventName == FolderEventName.deleted){
      return await folderRepo.deleteFolderDeleteRequestRepo(event);
    }
    throw UnimplementedError("Add case in Actions UseCase");
  }
}
