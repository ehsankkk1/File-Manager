

import 'package:file_manager/features/auth/domain/repositories/user_repo.dart';
import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../data_sources/user_datasource.dart';


class UserRepoImpl extends UserRepo{

  UserDataSource userDataSource;
  UserRepoImpl(this.userDataSource);

  @override
  Future login(LoginUserEvent loginUserEvent) async {

    return userDataSource.loginUserDataSource(loginUserEvent);

  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

}