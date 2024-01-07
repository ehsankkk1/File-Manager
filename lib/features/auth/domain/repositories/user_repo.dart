import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../entities/user_entity.dart';

abstract class UserRepo {
  Future login(LoginUserEvent loginUserEvent);
  Future signup(SignUpEvent signUpEvent);
  Future logout();
  Future saveUserLocalRepo(User user);
  Future removeUserFromLocalRepo();
  Future getUserFromLocalRepo();
}
