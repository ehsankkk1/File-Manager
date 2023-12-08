import '../../presentation/bloc/file_list_bloc/file_bloc.dart';
import '../repositories/file_repo.dart';


class GetFileByFolderIdUseCase {
  final FileRepo fileRepo;

  GetFileByFolderIdUseCase(this.fileRepo);

  Future call(GetFilesByFolderIdEvent event) async {
    return await fileRepo.getFileByFolderIdRequestRepo(event);
  }
}
