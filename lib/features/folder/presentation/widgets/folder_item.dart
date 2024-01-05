import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import 'package:file_manager/features/folder/domain/entities/folder_entity.dart';
import 'package:file_manager/features/folder/presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import 'package:file_manager/utility/router/app_routes.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/theme/app_borders.dart';
import '../bloc/folder_action_bloc/folder_new_action_bloc.dart';
import '../bloc/get_folders_bloc/folder_bloc.dart';

class FolderItemWidget extends StatelessWidget {
  FolderItemWidget(
      {required this.event,
      required this.folderEntity,
      Key? key,
      required this.index})
      : super(key: key);
  FolderEntity folderEntity;
  int index;
  FolderEvent event;

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
        if (event is GetMyFolderEvent) {
          Navigator.of(context).pushNamed(AppRoutes.folderUsers,
              arguments: GetFolderUsersEvent(folderId: folderEntity.id));
        } else {
          Navigator.of(context).pushNamed(AppRoutes.filesListScreen,
              arguments: GetFilesByFolderIdEvent(folderId: folderEntity.id));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: event is GetMyFolderEvent
                    ? AppColors.kOrangeWidgetColor
                    : AppColors.kSecondColor,
                radius: 30,
                child: Icon(event is GetMyFolderEvent
                    ? Icons.folder_shared_rounded
                    : Icons.folder_copy_outlined),
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
          if (event is GetMyFolderEvent)
            IconButton(
                onPressed: () {
                  context.read<FolderActionBloc>().add(SendFolderActionEvent(
                        folderEventName: FolderEventName.deleted,
                        folderId: folderEntity.id,
                      ));
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.redColor,
                ))
        ],
      ),
    );
  }
}
