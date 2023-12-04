import 'dart:convert';
import 'package:file_manager/features/auth/data/data_sources/user_datasource.dart';
import 'package:file_manager/features/auth/data/repositories/user_repo_impl.dart';
import 'package:file_manager/features/auth/domain/use_cases/login_usecase.dart';
import 'package:file_manager/utility/networking/network_helper.dart';
import 'package:flutter/material.dart';
import '../features/auth/presentation/bloc/user/user_bloc.dart';


UserBloc globalUserBloc
= UserBloc();

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

// UserBloc globalUserBloc = UserBloc();

const int kProductsGetLimit = 10;
const int kTagGetLimit = 20;

const double mapRadius = 200;

// bool isEnglish(BuildContext context) {
//   if (context.locale.languageCode == "ar") {
//     return false;
//   }
//   return true;
// }

// bool userIsLoggedIn(BuildContext context) {
//   final state = context.read<UserBloc>().state;
//   if (state is UserLoggedState) {
//     return true;
//   }
//   return false;
// }


bool getStatuesFromResponse(String streamRes) {
  Map<String, dynamic> jsonError = json.decode(streamRes);
  if (jsonError.containsKey("success")) {
    return jsonError["success"];
  }
  return false;
}
