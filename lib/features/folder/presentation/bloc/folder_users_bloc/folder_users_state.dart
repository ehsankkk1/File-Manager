part of 'folder_users_bloc.dart';

abstract class FolderUsersState extends Equatable {
  const FolderUsersState();
}

class FolderUsersInitial extends FolderUsersState {
  @override
  List<Object> get props => [];
}

class FolderUsersDoneState extends FolderUsersState {
  FolderUsersDoneState({required this.users});

  List<User> users;
  @override
  List<Object> get props => [users];
}

class FolderUsersErrorState extends FolderUsersState {
  FolderUsersErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props =>
      [helperResponse.servicesResponse, helperResponse.response];
}