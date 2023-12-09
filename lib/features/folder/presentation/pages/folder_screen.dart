import 'package:file_manager/features/folder/presentation/widgets/folder_list.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/get_folders_bloc/folder_bloc.dart';

class FolderScreen extends StatefulWidget {
  FolderScreen({required this.folderEvent, Key? key}) : super(key: key);
  FolderEvent folderEvent;
  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kSecondColor,
        title: Text(
          widget.folderEvent is GetCanAccessFolderEvent
              ? "Can Access Folders"
              : "My Folders",
          style:
              AppFontStyles.boldH2.copyWith(color: AppColors.kBackGroundColor),
        ),
      ),
      body: FolderList(event: widget.folderEvent),
    ));
  }
}
