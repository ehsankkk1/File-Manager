import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_manager/features/auth/data/repositories/user_repo_impl.dart';

import '../../../../../utility/networking/network_helper.dart';
import '../../../data/data_sources/user_datasource.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/login_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepoImpl userRepoImpl =
      UserRepoImpl(UserDataSource(NetworkHelpers()));

  UserBloc() : super(UserInit()) {
    on<LoginUserEvent>((event, emit) async {
      emit(UserLoading());

      LoginUsecase loginUsecase = LoginUsecase(userRepoImpl);
      final response = await loginUsecase.call(event);

      if (response is User) {
        emit(UserLoggedState(user: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    // on<LogoutEvent>((event, emit) {
    //   UserServices.logoutUserService();
    //   deleteUserFromLocal();
    //   emit(UserNotLoggedState());
    // });
  }
}
