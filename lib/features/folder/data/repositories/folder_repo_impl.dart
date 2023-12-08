import 'package:file_manager/features/folder/data/data_sources/folder_datasource.dart';
import 'package:file_manager/features/folder/domain/repositories/folder_repo.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';

class FolderRepoImpl extends FolderRepo {
  FolderRepoImpl(this.folderDataSource);
  FolderDataSource folderDataSource;

  @override
  Future getCanAccessFolder(
      GetCanAccessFolderEvent getCanAccessFolderEvent) async {
    return await folderDataSource.getCanAccessFolderData(
        event: getCanAccessFolderEvent);
  }
}
