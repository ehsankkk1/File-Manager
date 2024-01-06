import 'package:file_manager/features/auth/domain/entities/user_entity.dart';
import 'package:file_manager/features/auth/domain/repositories/user_repo.dart';
import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';

import '../data_sources/user_datasource.dart';

class UserRepoImpl extends UserRepo {
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

  @override
  Future saveUserLocalRepo(User user) async {
    return await userDataSource.saveUserToLocalStorage(user);
  }

  @override
  Future getUserFromLocalRepo() async {
    return await userDataSource.getUserFromLocalStorage();
  }

  @override
  Future removeUserFromLocalRepo() async {
    return await userDataSource.deleteUserFromLocal();
  }
}
