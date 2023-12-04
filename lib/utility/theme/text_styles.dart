import 'package:flutter/material.dart';
import 'color_style.dart';

abstract class AppFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w800;
}

abstract class AppFontStyles {
  static const String fontName = "Tajawal";

  ///////////// Regular ////////////////////////
  static const TextStyle regularH1 = TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeight.regular,
    fontFamily: fontName,
    color: AppColors.blackColor
  );
  static const TextStyle regularH2 = TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeight.regular,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle regularH3 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle regularH4 = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle regularH5 = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeight.regular,
    fontFamily: fontName,
      color: AppColors.blackColor

  );

  ///////////// Medium ////////////////////////

  static const TextStyle mediumH1 = TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeight.medium,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle mediumH2 = TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeight.medium,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle mediumH3 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle mediumH4 = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle mediumH5 = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeight.medium,
    fontFamily: fontName,
      color: AppColors.blackColor

  );

  ///////////// Bold ////////////////////////

  static const TextStyle boldH1 = TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeight.bold,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle boldH2 = TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeight.bold,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle boldH3 = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.bold,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle boldH4 = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.bold,
    fontFamily: fontName,
      color: AppColors.blackColor

  );
  static const TextStyle boldH5 = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeight.bold,
    fontFamily: fontName,
      color: AppColors.blackColor

  );

  //////// titles ///////////////
  static TextStyle titleH1({Color color = AppColors.blackColor}) =>
      const TextStyle(
        fontSize: 36,
        fontWeight: AppFontWeight.bold,
        fontFamily: fontName,
      ).copyWith(color: color);
}
