import 'package:file_manager/features/file_feature/domain/entities/file_entity.dart';
import 'package:flutter/material.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/theme/color_style.dart';
import '../../../../utility/theme/text_styles.dart';
import '../widgets/file_action_widget.dart';
import '../widgets/file_eventName_widget.dart';

class OneFileScreen extends StatelessWidget {
  OneFileScreen({required this.fileEntity, Key? key}) : super(key: key);
  FileEntity fileEntity;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kSecondColor,
        title: Text(
          fileEntity.title,
          style:
              AppFontStyles.boldH2.copyWith(color: AppColors.kBackGroundColor),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.07,
            bottom: screenHeight * 0.02),
        children: [
          CircleAvatar(
            backgroundColor: fileEntity.isAvailable
                ? AppColors.kGreenColor
                : AppColors.redColor,
            radius: 75,
            child: const Icon(
              Icons.file_copy_rounded,
              size: 60,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fileEntity.title,
                style: AppFontStyles.mediumH2,
              ),
              if (fileEntity.isAvailable)
                Text(
                  "Available",
                  style: AppFontStyles.boldH3
                      .copyWith(color: AppColors.kGreenColor),
                )
              else
                Text(
                  "Not Available",
                  style:
                      AppFontStyles.boldH3.copyWith(color: AppColors.redColor),
                )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "File Creator",
                style: AppFontStyles.mediumH2,
              ),
              Text(
                fileEntity.user.email,
                style: AppFontStyles.regularH2,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "CheckedIn By",
                style: AppFontStyles.mediumH2,
              ),
              Text(
                fileEntity.checkedInUser?.email ?? 'No one',
                style: AppFontStyles.regularH2,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                FileActionWidget(
                  title: 'Check In',
                  onPressed: () {},
                  icon: getFileEventNameIcon(FileEventName.checkedIn),
                ),
                SizedBox(
                  width: screenWidth * 0.038,
                ),
                FileActionWidget(
                  title: 'Check Out',
                  onPressed: () {},
                  icon:getFileEventNameIcon(FileEventName.checkedOut),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 0.038,
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                FileActionWidget(
                  title: 'Edit',
                  onPressed: () {},
                  icon: getFileEventNameIcon(FileEventName.updated),
                ),
                SizedBox(
                  width: screenWidth * 0.038,
                ),
                FileActionWidget(
                  title: 'Delete',
                  onPressed: () {},
                  icon: getFileEventNameIcon(FileEventName.deleted),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 0.1,
          ),
          
          const Text("Files Events",style: AppFontStyles.mediumH1,),
          SizedBox(
            height: screenWidth * 0.038,
          ),
          Column(
            children: List.generate(
                fileEntity.fileEvent.length,
                (index) => FileEventNameWidget(
                      fileEventEntity: fileEntity.fileEvent[index],
                      index: index,
                    )),
          ),
        ],
      ),
    );
  }
}
