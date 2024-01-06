import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';
import '../../../../utility/networking/network_helper.dart';
import '../../domain/entities/user_entity.dart';
import '../../presentation/bloc/user/user_bloc.dart';

class UserDataSource{

  UserDataSource(this.networkHelpers);
  final NetworkHelpers networkHelpers;

  Future<User?> getUserFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? localUser = prefs.getString("user");
    if (localUser == null) {
      return null;
    }
    User userFromLocal = User.fromJson(json.decode(localUser));

    return userFromLocal;
  }

  Future saveUserToLocalStorage(User user) async {
    String userString = json.encode(user.toJson());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", userString);
  }

  Future deleteUserFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  Future loginUserDataSource(LoginUserEvent loginUserEvent) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      url: EndPoints.login,
      body: json.encode({
        "email": loginUserEvent.email,
        "password": loginUserEvent.password,
      }),
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return userFromJson(helperResponse.response);
      } catch (e) {
        return helperResponse.copyWith(
            servicesResponse: ServicesResponseStatues.modelError);
      }
    }
    return helperResponse;
  }
}