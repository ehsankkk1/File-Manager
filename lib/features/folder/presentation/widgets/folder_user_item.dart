import 'package:file_manager/features/folder/presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../utility/theme/app_borders.dart';
import '../../../auth/domain/entities/user_entity.dart';

class FolderUserItemWidget extends StatelessWidget {
  FolderUserItemWidget({required this.event,required this.user, Key? key, required this.index})
      : super(key: key);
  User user;
  FolderUsersEvent event;
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

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
                child: Icon(Icons.person),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                user.email,
                style: AppFontStyles.mediumH3,
              ),
            ],
          ),
          // if (user.isAvailable)
          //   Text(
          //     "Available",
          //     style:
          //     AppFontStyles.boldH3.copyWith(color: AppColors.kGreenColor),
          //   )
          // else
          //   Text(
          //     "Not Available",
          //     style: AppFontStyles.boldH3.copyWith(color: AppColors.redColor),
          //   )
        ],
      ),
    );
  }
}
