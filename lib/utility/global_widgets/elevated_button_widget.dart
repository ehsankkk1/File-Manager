import 'package:flutter/material.dart';
import '../../utility/theme/app_borders.dart';
import '../../utility/theme/app_style.dart';
import '../../utility/theme/color_style.dart';
import '../../utility/theme/text_styles.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    this.mainColor = AppColors.kMainColor100,
    this.gradientColor = AppColors.kMainColor100,
    this.title = '',
    this.onPressed,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  Function()? onPressed;
  String title;
  Color mainColor;
  Color gradientColor;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return Builder(builder: (context) {
      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.85, -0.53),
            end: const Alignment(-0.85, 0.53),
            colors: [gradientColor, mainColor],
          ),
          borderRadius: AppBorders.k8BorderRadius,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.kMainColor100,
            elevation: 0,
            disabledBackgroundColor: AppColors.kGreyColor,
            animationDuration: const Duration(milliseconds: 250),
            minimumSize: Size(double.infinity, getHeight * 0.045),
            maximumSize: Size(double.infinity, getHeight * 0.1),
            shape: const RoundedRectangleBorder(
              borderRadius: AppBorders.k8BorderRadius, // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.kBackGroundColor,
              fontWeight: AppFontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    });
  }
}
