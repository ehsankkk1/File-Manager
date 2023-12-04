import 'package:file_manager/features/folder/domain/repositories/folder_repo.dart';
import 'package:file_manager/features/folder/presentation/bloc/folder_bloc.dart';

class GetCanAccessFolderUsecase {
  final FolderRepo folderRepo;

  GetCanAccessFolderUsecase(this.folderRepo);

  Future call(GetCanAccessFolderEvent getCanAccessFolderEvent) async {
    return await folderRepo.getCanAccessFolder(getCanAccessFolderEvent);
  }
}
