part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class CheckUserFromLocalStorage extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends UserEvent {
  LoginUserEvent({required this.password, required this.email});
  String email;
  String password;

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends UserEvent {
  SignUpEvent({
    required this.password,
    required this.rePassword,
    required this.email,
    required this.fullName,
  });
  String email;
  String password;
  String rePassword;
  String fullName;

  Map<String, dynamic> toJson() => {
        "name": fullName,
        "email": email,
        "password": password,
      };

  @override
  List<Object?> get props => [password, email, fullName, rePassword];
}

class LogoutEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
