import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repo.dart';

class SaveUserLocalUsecase {
  final UserRepo userRepo;

  SaveUserLocalUsecase(this.userRepo);

  Future call(User user) async {
    return await userRepo.saveUserLocalRepo(user);
  }
}
