import 'dart:io';

import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';
import 'package:file_manager/features/file_feature/presentation/widgets/file_list.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/dialogs_and_snackbars/dialogs_snackBar.dart';
import '../../../../utility/enums.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/file_list_bloc/file_bloc.dart';
import '../widgets/add_file_dialog.dart';

class FileListScreen extends StatefulWidget {
  FileListScreen({required this.fileEvent, Key? key}) : super(key: key);

  FileEvent fileEvent;

  @override
  State<FileListScreen> createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  void refresh(){
    context.read<FileBloc>().add(widget.fileEvent);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kSecondColor,
        title: Text(
          "Files",
          style:
              AppFontStyles.boldH2.copyWith(color: AppColors.kBackGroundColor),
        ),
      ),
      body: FileList(event: widget.fileEvent),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: AppColors.kMainColor100,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BlocProvider(
                    create: (context) => FileActionBloc(),
                    child: BlocListener<FileActionBloc, FileActionState>(
                      listener: (context, state) {
                        if (state is FileActionResponseState) {
                          DialogsWidgetsSnackBar.showSnackBarFromStatus(
                            context: context,
                            helperResponse: state.helperResponse,
                            popOnSuccess: true,
                          );
                          refresh();
                        }
                      },
                      child: AddFileDialogWidget(
                        folderId: widget.fileEvent.folderId,
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add),
        );
      }),
    ));
  }
}
