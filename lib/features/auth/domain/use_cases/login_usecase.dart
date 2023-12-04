import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../repositories/user_repo.dart';

class LoginUsecase {
  final UserRepo userRepo;

  LoginUsecase(this.userRepo);

  Future call(LoginUserEvent loginUserEvent) async {
    return await userRepo.login(loginUserEvent);
  }
}
