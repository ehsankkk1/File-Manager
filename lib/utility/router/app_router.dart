import 'package:file_manager/features/file_feature/presentation/bloc/file_bloc.dart';
import 'package:file_manager/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/bottom_nav_bar/bottom_nav_bar.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/file_feature/presentation/pages/file_screen.dart';
import 'app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case AppRoutes.splashScreen:
          return const SplashScreen();

        case AppRoutes.bottomNavBarScreen:
          return const BottomNavBar();

        case AppRoutes.login:
          return const LoginScreen();

        case AppRoutes.filesScreen:
          FileEvent args = settings.arguments as FileEvent;
          return BlocProvider(
            create: (context) => FileBloc(),
            child: FileScreen(fileEvent: args,),
          );

        default:
          return const Scaffold(
            body: Center(
              child: Text(
                'Check Named Route',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
      }
    });
  }
}
