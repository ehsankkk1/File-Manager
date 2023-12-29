import 'package:file_manager/features/file_feature/domain/entities/file_entity.dart';
import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';
import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import 'package:file_manager/features/auth/presentation/pages/login_screen.dart';
import 'package:file_manager/features/file_feature/presentation/pages/one_file_screen.dart';
import 'package:file_manager/features/folder/presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import 'package:file_manager/features/folder/presentation/pages/folder_access_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/bottom_nav_bar/bottom_nav_bar.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/file_feature/presentation/pages/file_list_screen.dart';
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

        case AppRoutes.filesListScreen:
          FileEvent args = settings.arguments as FileEvent;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FileBloc(),
              ),
            ],
            child: FileListScreen(
              fileEvent: args,
            ),
          );

        case AppRoutes.oneFilesScreen:
          FileEntity args = settings.arguments as FileEntity;
          return BlocProvider(
            create: (context) => FileActionBloc(),
            child: OneFileScreen(
              fileEntity: args,
            ),
          );

        case AppRoutes.folderUsers:
          FolderUsersEvent args = settings.arguments as FolderUsersEvent;
          return BlocProvider(
            create: (context) => FolderUsersBloc(),
            child: FolderUsersScreen(
              folderUsersEvent: args,
            ),
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
