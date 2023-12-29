import 'dart:io';

import 'package:file_manager/features/folder/presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/dialogs_and_snackbars/dialogs_snackBar.dart';
import '../../../../utility/theme/color_style.dart';
import '../../../../utility/theme/text_styles.dart';
import '../bloc/folder_users_bloc/folder_users_bloc.dart';
import '../widgets/add_user_dialog.dart';
import '../widgets/folder_users_list.dart';

class FolderUsersScreen extends StatefulWidget {
  FolderUsersScreen({required this.folderUsersEvent, Key? key}) : super(key: key);

  FolderUsersEvent folderUsersEvent;

  @override
  State<FolderUsersScreen> createState() => _FolderUsersScreenState();
}

class _FolderUsersScreenState extends State<FolderUsersScreen> {
  void refresh(){
    context.read<FolderUsersBloc>().add(widget.folderUsersEvent);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kBackGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.kSecondColor,
            title: Text(
              "FolderUsers",
              style:
              AppFontStyles.boldH2.copyWith(color: AppColors.kBackGroundColor),
            ),
          ),
          body: FolderUsersList(event: widget.folderUsersEvent),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              backgroundColor: AppColors.kMainColor100,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => FolderActionBloc(),
                        child: BlocListener<FolderActionBloc, FolderActionState>(
                          listener: (context, state) {
                            if (state is FolderActionResponseState) {
                              DialogsWidgetsSnackBar.showSnackBarFromStatus(
                                context: context,
                                helperResponse: state.helperResponse,
                                popOnSuccess: true,
                              );
                              refresh();
                            }
                          },
                          child: AddUserDialogWidget(
                            folderId: (widget.folderUsersEvent as GetFolderUsersEvent).folderId,
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(Icons.person_add_alt_1_rounded),
            );
          }),
        ));
  }
}
