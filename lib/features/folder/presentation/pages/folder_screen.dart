import 'package:file_manager/features/folder/presentation/widgets/folder_list.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/dialogs_and_snackbars/dialogs_snackBar.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/folder_action_bloc/folder_new_action_bloc.dart';
import '../bloc/get_folders_bloc/folder_bloc.dart';
import '../widgets/add_folder_dialog.dart';

class FolderScreen extends StatefulWidget {
  FolderScreen({required this.folderEvent, Key? key}) : super(key: key);
  FolderEvent folderEvent;
  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  void refresh(){
    context.read<FolderBloc>().add(widget.folderEvent);
  }
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
                      child: const AddFolderDialogWidget(),
                    ),
                  );
                });
          },
          child: const Icon(Icons.drive_folder_upload_rounded),
        );
      }),
    ));
  }
}
