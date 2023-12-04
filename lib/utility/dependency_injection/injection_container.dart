import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final globalInjection = GetIt.instance;

Future<void> initGlobalGetIt() async {

//! External

  //
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  globalInjection
      .registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);

}
