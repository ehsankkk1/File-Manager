import '../../presentation/bloc/file_action_bloc/file_action_bloc.dart';
import '../../presentation/bloc/file_list_bloc/file_bloc.dart';


abstract class FileRepo {

  Future getFileByFolderIdRequestRepo(GetFilesByFolderIdEvent event);
  Future checkInFilePatchRequestRepo(SendFileNewActionEvent event);
  Future checkOutFilePatchRequestRepo(SendFileNewActionEvent event);
  Future deleteFilePatchRequestRepo(SendFileNewActionEvent event);
}