
import '../../presentation/bloc/get_folders_bloc/folder_bloc.dart';

abstract class FolderRepo{
  Future getCanAccessFolder(GetCanAccessFolderEvent getCanAccessFolderEvent);

}