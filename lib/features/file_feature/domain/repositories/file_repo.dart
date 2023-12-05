import '../../presentation/bloc/file_list_bloc/file_bloc.dart';


abstract class FileRepo {

  Future getFileByFolderIdRequest(GetFilesByFolderIdEvent event);

}