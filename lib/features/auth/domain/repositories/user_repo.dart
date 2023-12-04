

import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

abstract class UserRepo{
  Future login(LoginUserEvent loginUserEvent);
  Future logout();
}