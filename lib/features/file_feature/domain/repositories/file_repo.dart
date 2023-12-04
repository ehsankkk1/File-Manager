import '../../presentation/bloc/file_bloc.dart';


abstract class FileRepo {

  Future getFileByFolderIdRequest(GetFilesByFolderIdEvent event);

}