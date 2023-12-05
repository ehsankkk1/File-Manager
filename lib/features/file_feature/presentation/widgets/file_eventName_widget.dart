import 'package:file_manager/features/file_feature/domain/entities/file_event_entity.dart';
import 'package:file_manager/utility/enums.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utility/theme/app_borders.dart';

class FileEventNameWidget extends StatelessWidget {
  FileEventNameWidget(
      {required this.fileEventEntity, Key? key, required this.index})
      : super(key: key);
  FileEventEntity fileEventEntity;
  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: const Color(0xff232323),
        elevation: 0,
        disabledBackgroundColor: AppColors.kWhiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorders.k0BorderRadius, // <-- Radius
        ),
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
      ),
      onPressed: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.kPurpleColor,
                radius: 30,
                child: Icon(getFileEventNameIcon(fileEventEntity.eventName)),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                eventNameValuesUI.reverse[fileEventEntity.eventName] ?? '',
                style: AppFontStyles.mediumH3,
              ),
            ],
          ),
          Text(
            DateFormat.yMd().add_jms().format(fileEventEntity.createdAt),
            style: AppFontStyles.regularH4,
          )
        ],
      ),
    );
  }
}
