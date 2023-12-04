import 'package:flutter/material.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../theme/app_borders.dart';
import '../theme/color_style.dart';

class DialogsWidgetsYesNo {
  static void showYesNoDialog({
    TextEditingController? controller,
    TextEditingController? attributeNameController,
    String? operationName,
    required String title,
    required String noTitle,
    required String yesTitle,
    required Function() onYesTap,
    Function()? onYes,
    required Function() onNoTap,
    required BuildContext context,
    GlobalKey<FormState>? key,
  }) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    var alertDialog = Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(15),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: getHeight * 0.01,
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: AppBorders.k15BorderRadius,
                color: AppColors.kBackGroundColor),
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
                getWidth * 0.038, getWidth * 0.038),
            child: Wrap(
              spacing: 10,
              children: [
                Center(
                  child: Text(title,
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: getWidth * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButtonWidget(
                        title: noTitle,
                        mainColor: AppColors.kGreyColor,
                        gradientColor: AppColors.kGreyColor,
                        onPressed: onNoTap,
                      ),
                    ),
                    SizedBox(
                      width: getWidth * 0.038,
                    ),
                    Expanded(
                      child: ElevatedButtonWidget(
                          title: yesTitle, onPressed: onYesTap),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  static Future<bool> onWillPopMethod(BuildContext context) async {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    var alertDialog = Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(15),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: getHeight * 0.01,
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: AppBorders.k4BorderRadius,
                color: AppColors.kBackGroundColor),
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
                getWidth * 0.038, getWidth * 0.038),
            child: Wrap(
              spacing: 10,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text("Are you sure you want to exit !",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: getWidth * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ElevatedButtonWidget(
                        title: "Cancel",
                        mainColor: AppColors.kGreyColor,
                        gradientColor: AppColors.kGreyColor,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                    SizedBox(
                      width: getWidth * 0.038,
                    ),
                    Expanded(
                      flex: 6,
                      child: ElevatedButtonWidget(
                        title: "Exit",
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
    return (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog;
            })) ??
        false;
  }

  // static void showLanguageBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         double getWidth = MediaQuery.of(context).size.width;
  //         String? radioValue = context.locale.languageCode;
  //         return StatefulBuilder(
  //           builder: (BuildContext context,
  //               void Function(void Function()) setState) {
  //             return SingleChildScrollView(
  //               child: Padding(
  //                 padding: EdgeInsets.all(getWidth * 0.038),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     RadioListTile(
  //                         contentPadding: const EdgeInsets.all(0),
  //                         activeColor: AppColors.kMainColor100,
  //                         title: const Text(
  //                           "English",
  //                         ),
  //                         value: "en",
  //                         groupValue: radioValue,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             radioValue = value;
  //                           });
  //                         }),
  //                     RadioListTile(
  //                         contentPadding: const EdgeInsets.all(0),
  //                         activeColor: AppColors.kMainColor100,
  //                         title: const Text(
  //                           "العربية",
  //                         ),
  //                         value: "ar",
  //                         groupValue: radioValue,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             radioValue = value;
  //                           });
  //                         }),
  //                     ElevatedButtonWidget(
  //                       title: 'Save'.tr(),
  //                       onPressed: () {
  //                         context.setLocale(Locale(radioValue ?? 'en'));
  //                         Navigator.of(context).pop();
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       });
  // }
}
