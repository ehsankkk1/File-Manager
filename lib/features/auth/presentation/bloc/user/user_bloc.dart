import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_manager/features/auth/data/repositories/user_repo_impl.dart';
import 'package:file_manager/features/auth/domain/use_cases/get_user_from_local_usecase.dart';
import 'package:file_manager/features/auth/domain/use_cases/remove_user_from_local_usecase.dart';
import 'package:file_manager/features/auth/domain/use_cases/save_user_local_usecase.dart';
import 'package:file_manager/features/auth/domain/use_cases/signup_usecase.dart';

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
    on<CheckUserFromLocalStorage>((event, emit) async {
      GetUserFromLocalUsecase getUserFromLocalUsecase =
          GetUserFromLocalUsecase(userRepoImpl);
      final user = await getUserFromLocalUsecase.call();

      await Future.delayed(const Duration(milliseconds: 100));

      if (user != null) {
        emit(UserLoggedState(user: user));
      } else {
        emit(UserNotLoggedState());
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(UserLoading());
      SignupUsecase signupUsecase = SignupUsecase(userRepoImpl);
      final response = await signupUsecase.call(event);

      if (response is User) {
        SaveUserLocalUsecase saveUserLocalUsecase = SaveUserLocalUsecase(userRepoImpl);
        saveUserLocalUsecase.call(response);
        emit(UserLoggedState(user: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(UserLoading());

      LoginUsecase loginUsecase = LoginUsecase(userRepoImpl);
      final response = await loginUsecase.call(event);

      if (response is User) {
        emit(UserLoggedState(user: response));

        // Save User To Local Storage
        SaveUserLocalUsecase saveUserLocalUsecase =
            SaveUserLocalUsecase(userRepoImpl);
        await saveUserLocalUsecase.call(response);
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<LogoutEvent>((event, emit) async {
      RemoveUserFromLocalUsecase removeUserFromLocalUsecase =
          RemoveUserFromLocalUsecase(userRepoImpl);
      removeUserFromLocalUsecase.call();
      emit(UserNotLoggedState());
    });
  }
}
