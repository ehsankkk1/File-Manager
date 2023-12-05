import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import 'package:file_manager/features/folder/domain/entities/folder_entity.dart';
import 'package:file_manager/utility/router/app_routes.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utility/theme/app_borders.dart';

class FolderItemWidget extends StatelessWidget {
  FolderItemWidget({required this.folderEntity, Key? key, required this.index})
      : super(key: key);
  FolderEntity folderEntity;
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
        disabledBackgroundColor: AppColors.kGreyColor,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorders.k0BorderRadius, // <-- Radius
        ),
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.filesListScreen,
            arguments: GetFilesByFolderIdEvent(folderId: folderEntity.id));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.kSecondColor,
            radius: 30,
            child: Icon(Icons.folder_copy_outlined),
          ),
          SizedBox(
            width: screenWidth * 0.02,
          ),
          Text(
            folderEntity.title,
            style: AppFontStyles.mediumH3,
          ),
        ],
      ),
    );
  }
}
