import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utility/theme/app_style.dart';

class FileActionWidget extends StatelessWidget {
  FileActionWidget({
    required this.title,
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);

  String title;
  IconData icon;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kWhiteColor,
          elevation: 2,
          surfaceTintColor: Colors.white,
          padding: const EdgeInsets.all(8),
          disabledBackgroundColor: AppColors.kGreyColor,
          animationDuration: const Duration(milliseconds: 250),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Padding(
                padding: EdgeInsets.all(getHeight *0.01),
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon,color: AppColors.kMainColor100,),
                      //const SizedBox(height: 12),
                      Text(title, style: AppFontStyles.mediumH5),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
