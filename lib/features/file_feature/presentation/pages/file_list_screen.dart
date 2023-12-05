import 'package:file_manager/features/file_feature/presentation/widgets/file_list.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/file_list_bloc/file_bloc.dart';


class FileListScreen extends StatefulWidget {
  FileListScreen({required this.fileEvent,Key? key}) : super(key: key);

  FileEvent fileEvent;
  @override
  State<FileListScreen> createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kBackGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.kSecondColor,
            title: Text(
              "Files",
              style: AppFontStyles.boldH2
                  .copyWith(color: AppColors.kBackGroundColor),
            ),
          ),
          body: FileList(event: widget.fileEvent),
        ));
  }
}
