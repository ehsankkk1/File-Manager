import 'package:file_manager/features/file_feature/presentation/widgets/file_list.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/file_bloc.dart';


class FileScreen extends StatefulWidget {
  FileScreen({required this.fileEvent,Key? key}) : super(key: key);

  FileEvent fileEvent;
  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
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
