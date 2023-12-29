import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/theme/color_style.dart';
import '../../../../utility/theme/text_styles.dart';
import '../bloc/folder_users_bloc/folder_users_bloc.dart';
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
                      return Container();
                      // return BlocProvider(
                      //   create: (context) => FolderUsersActionBloc(),
                      //   child: BlocListener<FolderUsersActionBloc, FolderUsersActionState>(
                      //     listener: (context, state) {
                      //       if (state is FolderUsersActionResponseState) {
                      //         DialogsWidgetsSnackBar.showSnackBarFromStatus(
                      //           context: context,
                      //           helperResponse: state.helperResponse,
                      //           popOnSuccess: true,
                      //         );
                      //         refresh();
                      //       }
                      //     },
                      //     child: AddFolderUsersDialogWidget(
                      //       folderId: widget.FolderUsersEvent.folderId,
                      //     ),
                      //   ),
                      // );
                    });
              },
              child: const Icon(Icons.add),
            );
          }),
        ));
  }
}
