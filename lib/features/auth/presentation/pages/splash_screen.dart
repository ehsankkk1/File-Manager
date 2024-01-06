import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../utility/router/app_routes.dart';
import '../../../../utility/theme/color_style.dart';
import '../../../../utility/theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoggedState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.bottomNavBarScreen, (Route<dynamic> route) => false);
        }
        if (state is UserNotLoggedState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kMainColor100,
        body: Center(
            child: Text(
          "File Manager",
          style: AppFontStyles.titleH1(color: AppColors.kBackGroundColor),
        )),
      ),
    );
  }
}
