
import '../../presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import '../../presentation/bloc/get_folders_bloc/folder_bloc.dart';

abstract class FolderRepo{
  Future getCanAccessFolder(GetCanAccessFolderEvent getCanAccessFolderEvent);
  Future getMyFolder(GetMyFolderEvent getMyFolderEvent);
  Future getFolderUsers(GetFolderUsersEvent getFolderUsersEvent);
}