import 'package:file_manager/features/folder/domain/entities/folder_entity.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';


class FolderItemWidget extends StatelessWidget {
  FolderItemWidget(
      {required this.folderEntity, Key? key, required this.index})
      : super(key: key);
  FolderEntity folderEntity;
  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.blackColor),
              ),
              child: const CircleAvatar(
                radius: 37,
                backgroundColor: AppColors.blackColor,
                child: CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.folder_copy_outlined),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    folderEntity.title,
                    style: AppFontStyles.mediumH3,
                  ),
                  // Text(
                  //   notification.notification.body,
                  //   style: Theme.of(context).textTheme.headline5,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
