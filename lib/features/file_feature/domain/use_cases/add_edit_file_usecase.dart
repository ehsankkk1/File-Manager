import '../../../../utility/enums.dart';
import '../../presentation/bloc/file_action_bloc/file_action_bloc.dart';
import '../../presentation/bloc/file_list_bloc/file_bloc.dart';
import '../repositories/file_repo.dart';

class AddEditFileUseCase {
  final FileRepo fileRepo;

  AddEditFileUseCase(this.fileRepo);

  Future call(AddEditFileActionEvent event) async {
    if (event.fileId != null) {
      return await fileRepo.editFilePatchRequestRepo(event);
    }
    return await fileRepo.addFilePostRequestRepo(event);
  }
}
