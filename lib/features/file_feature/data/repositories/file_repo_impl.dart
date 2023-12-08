import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';
import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import '../../domain/repositories/file_repo.dart';
import '../data_sources/file_datasource.dart';

class FileRepoImpl extends FileRepo {
  FileRepoImpl(this.fileDataSource);
  FileDataSource fileDataSource;

  @override
  Future getFileByFolderIdRequestRepo(GetFilesByFolderIdEvent event) async {
    return await fileDataSource.getFilesByFolderIdDataSource(event: event);
  }

  @override
  Future checkInFilePatchRequestRepo(SendFileNewActionEvent event) async {
    return await fileDataSource.checkInFileDataSource(event: event);
  }

  @override
  Future checkOutFilePatchRequestRepo(SendFileNewActionEvent event) async {
    return await fileDataSource.checkOutFileDataSource(event: event);
  }

  @override
  Future deleteFilePatchRequestRepo(SendFileNewActionEvent event) async {
    return await fileDataSource.deleteFileDataSource(event: event);
  }
}
