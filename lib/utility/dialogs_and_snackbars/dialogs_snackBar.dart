import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../utility/enums.dart';
import '../networking/network_helper.dart';
import '../theme/app_style.dart';
import '../theme/color_style.dart';

class DialogsWidgetsSnackBar {

  static void showScaffoldSnackBar({
    required String title,
    required BuildContext context,
    Color color = AppColors.redColor,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: k5RadiusLowerPadding,
          // ),
          dismissDirection: DismissDirection.none,
          content: Text(
            title,
            style: AppFontStyles.boldH3.copyWith(color: AppColors.kBackGroundColor),
          ),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
          backgroundColor: color,
          duration: const Duration(milliseconds: 1500),
        ));
  }

  static void showSnackBarFromStatus({
    required BuildContext context,
    required HelperResponse helperResponse,
    bool showServerError = true,
    bool popOnSuccess = true,
    bool popBeforeMessage = false,
    int popOnSuccessCount = 1,
  }) {
    if(popBeforeMessage){
      Navigator.of(context).pop();
    }
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      if(popOnSuccess){
        for(int i=0;i<popOnSuccessCount;i++){
          Navigator.of(context).pop();
        }
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          color: AppColors.kGreenColor,
          context: context
      );

    }
    if(showServerError){
      if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
        return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          context: context,
        );
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: helperResponse.response,
          color: AppColors.redColor,
          context: context
      );
    }
    if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }
    else {
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }

  }


}
