import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../repositories/user_repo.dart';

class SignupUsecase {
  final UserRepo userRepo;

  SignupUsecase(this.userRepo);

  Future call(SignUpEvent signupEvent) async {
    return await userRepo.signup(signupEvent);
  }
}
