import 'package:file_manager/features/auth/presentation/pages/splash_screen.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../folder/presentation/pages/folder_screen.dart';


class GetSelectedScreenByIndex extends StatelessWidget {
  const GetSelectedScreenByIndex({required this.screenIndex, Key? key})
      : super(key: key);
  final int screenIndex;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if (screenIndex == 0) {
            return BlocProvider(
              create: (context) => FolderBloc(),
              child: FolderScreen(),
            );
          }
          // if (screenIndex == 1) {
          //   return BlocProvider(
          //     create: (context) => GetNearbyPropertiesBloc(),
          //     child: const MapScreen(),
          //   );
          // }
          // if (screenIndex == 2) {
          //   return const WelcomeStep();
          // }
          // if (screenIndex == 3) {
          //   return const FavoriteScreen();
          // }
          // if (screenIndex == 4) {
          //   return const MoreScreen();
          // }
          return const Scaffold(
            body: Center(
              child: Text(
                'Check Named Route',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
        }
    );
  }
}