import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'color_style.dart';

class AppStyle {
  static ThemeData theme = ThemeData(
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.kBackGroundColor),
    highlightColor:AppColors.kBackGroundColor,
    primaryColor: AppColors.kMainColor100,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.kBackGroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary:  AppColors.kMainColor100,
      secondary:  AppColors.kMainColor100,
      surfaceTint:AppColors.kBackGroundColor,
      background:AppColors.kBackGroundColor,
    ),
    chipTheme: const ChipThemeData(
        backgroundColor: Colors.white, selectedColor: AppColors.kMainColor100),
    progressIndicatorTheme: const ProgressIndicatorThemeData()
        .copyWith(refreshBackgroundColor: AppColors.kBackGroundColor),
    radioTheme: const RadioThemeData().copyWith(
        fillColor: MaterialStateProperty.all<Color>(AppColors.kMainColor100)),
    checkboxTheme: const CheckboxThemeData().copyWith(
      side: const BorderSide(color: Color(0xFF5BBA6F) , width: 2, ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
    // checkboxTheme: const CheckboxThemeData().copyWith(
    //     fillColor: MaterialStateProperty.all<Color>(AppColors.kMainColor100)),
    appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.kBackGroundColor,
        surfaceTintColor: AppColors.kMainColor100,
        centerTitle: true,
        titleTextStyle: AppFontStyles.boldH1),
    dividerColor: const Color(0xFFD9D9D9),

    fontFamily: AppFontStyles.fontName,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        foregroundColor: AppColors.kGreyColor,
      ),
    ),

    textTheme: TextTheme(
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      // border: InputBorder.none,
      // hintStyle: const TextStyle(color: AppColors.kGreyColor),
      // enabledBorder: InputBorder.none,
      // focusedBorder: InputBorder.none,
      // disabledBorder: InputBorder.none,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
    ),
  );
}
