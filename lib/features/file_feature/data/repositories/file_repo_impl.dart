import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import '../../domain/repositories/file_repo.dart';
import '../data_sources/file_datasource.dart';

class FileRepoImpl extends FileRepo {
  FileRepoImpl(this.fileDataSource);
  FileDataSource fileDataSource;

  @override
  Future getFileByFolderIdRequest(GetFilesByFolderIdEvent event) async {
    return await fileDataSource.getFilesByFolderId(event: event);
  }


}
