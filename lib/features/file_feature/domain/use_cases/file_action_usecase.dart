
import 'package:file_manager/utility/enums.dart';

import '../../presentation/bloc/file_action_bloc/file_action_bloc.dart';
import '../repositories/file_repo.dart';

class PostFileActionUseCase {
  final FileRepo fileRepo;

  PostFileActionUseCase(this.fileRepo);

  Future call(SendFileNewActionEvent event) async {
    if(event.fileEventName == FileEventName.checkedIn){
      return await fileRepo.checkInFilePatchRequestRepo(event);
    }
    if(event.fileEventName == FileEventName.checkedOut){
      return await fileRepo.checkOutFilePatchRequestRepo(event);
    }
    if(event.fileEventName == FileEventName.deleted){
      return await fileRepo.deleteFilePatchRequestRepo(event);
    }
    throw UnimplementedError("Add case in Actions UseCase");
  }
}
