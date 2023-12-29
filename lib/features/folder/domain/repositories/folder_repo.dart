
import '../../presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';
import '../../presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import '../../presentation/bloc/get_folders_bloc/folder_bloc.dart';

abstract class FolderRepo{
  Future getCanAccessFolder(GetCanAccessFolderEvent getCanAccessFolderEvent);
  Future getMyFolder(GetMyFolderEvent getMyFolderEvent);
  Future getFolderUsers(GetFolderUsersEvent getFolderUsersEvent);
  Future removeUserFolderDeleteRequestRepo(SendFolderActionEvent sendFolderNewActionEvent);
  Future addUserFolderPostRequestRepo(SendFolderActionEvent sendFolderNewActionEvent);
  Future deleteFolderDeleteRequestRepo(SendFolderActionEvent sendFolderNewActionEvent);
}