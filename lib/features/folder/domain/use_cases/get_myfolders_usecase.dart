import 'package:file_manager/features/folder/domain/repositories/folder_repo.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';

class GetMyFolderUsecase {
  final FolderRepo folderRepo;

  GetMyFolderUsecase(this.folderRepo);

  Future call(GetMyFolderEvent getMyFolderEvent) async {
    return await folderRepo.getMyFolder(getMyFolderEvent);
  }
}
