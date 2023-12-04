
import '../../presentation/bloc/folder_bloc.dart';

abstract class FolderRepo{
  Future getCanAccessFolder(GetCanAccessFolderEvent getCanAccessFolderEvent);

}