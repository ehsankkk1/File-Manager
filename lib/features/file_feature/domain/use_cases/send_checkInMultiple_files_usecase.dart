import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';

import '../../presentation/bloc/file_list_bloc/file_bloc.dart';
import '../repositories/file_repo.dart';


class CheckInMultipleFilesUseCase {
  final FileRepo fileRepo;

  CheckInMultipleFilesUseCase(this.fileRepo);

  Future call(SendCheckInMultipleFilesEvent event) async {
    return await fileRepo.sendCheckInMultipleFilesPatchRequestRepo(event);
  }
}
