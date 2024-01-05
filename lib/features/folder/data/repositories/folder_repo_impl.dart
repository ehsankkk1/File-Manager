import 'package:file_manager/features/folder/data/data_sources/folder_datasource.dart';
import 'package:file_manager/features/folder/domain/repositories/folder_repo.dart';
import 'package:file_manager/features/folder/presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';

import '../../presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';

class FolderRepoImpl extends FolderRepo {
  FolderRepoImpl(this.folderDataSource);
  FolderDataSource folderDataSource;

  @override
  Future getCanAccessFolder(
      GetCanAccessFolderEvent getCanAccessFolderEvent) async {
    return await folderDataSource.getCanAccessFolderData(
        event: getCanAccessFolderEvent);
  }

  @override
  Future getMyFolder(GetMyFolderEvent getMyFolderEvent) async {
    return await folderDataSource.getMyFolderData(event: getMyFolderEvent);
  }

  @override
  Future getFolderUsers(GetFolderUsersEvent getFolderUsersEvent) async {
    return await folderDataSource.getFolderUsers(event: getFolderUsersEvent);
  }

  @override
  Future addUserFolderPostRequestRepo(
      SendFolderActionEvent sendFolderNewActionEvent) async {
    return await folderDataSource.addUserToFolder(
        event: sendFolderNewActionEvent);
  }

  @override
  Future deleteFolderDeleteRequestRepo(
      SendFolderActionEvent sendFolderNewActionEvent) async {
    return await folderDataSource.deleteFolder(event: sendFolderNewActionEvent);
  }

  @override
  Future removeUserFolderDeleteRequestRepo(
      SendFolderActionEvent sendFolderNewActionEvent) async {
    return await folderDataSource.removeUserFromFolder(
        event: sendFolderNewActionEvent);
  }

  @override
  Future postNewFolderRequestRepo(AddFolderEvent addFolderEvent) async {
    return await folderDataSource.addNewFolder(event: addFolderEvent);
  }
}
