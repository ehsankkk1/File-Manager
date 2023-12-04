import 'dart:convert';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';
import '../../../../utility/networking/network_helper.dart';
import '../../domain/entities/user_entity.dart';
import '../../presentation/bloc/user/user_bloc.dart';

class UserDataSource{

  UserDataSource(this.networkHelpers);
  final NetworkHelpers networkHelpers;

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