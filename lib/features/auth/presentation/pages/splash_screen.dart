import 'package:flutter/material.dart';
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
    navigate();
    super.initState();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacementNamed(AppRoutes.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainColor100,
      body: Center(
          child: Text(
        "File Manager",
        style: AppFontStyles.titleH1(color: AppColors.kBackGroundColor),
      )),
    );
  }
}
