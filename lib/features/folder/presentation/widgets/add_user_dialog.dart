import 'dart:io';
import 'package:file_manager/features/folder/presentation/bloc/folder_action_bloc/folder_new_action_bloc.dart';
import 'package:file_manager/utility/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/enums.dart';
import '../../../../utility/global_widgets/elevated_button_widget.dart';
import '../../../../utility/theme/app_borders.dart';
import '../../../../utility/theme/color_style.dart';

class AddUserDialogWidget extends StatefulWidget {
  AddUserDialogWidget({required this.folderId, Key? key}) : super(key: key);
  int folderId;
  @override
  State<AddUserDialogWidget> createState() => _AddUserDialogWidgetState();
}

class _AddUserDialogWidgetState extends State<AddUserDialogWidget> {
  TextEditingController userEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(15),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: getHeight * 0.01,
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: AppBorders.k15BorderRadius,
                color: AppColors.kBackGroundColor),
            padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
                getWidth * 0.038, getWidth * 0.038),
            child: Wrap(
              spacing: 10,
              children: [
                CustomTextField(
                  label: "Email",
                  controller: userEmailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<FolderActionBloc, FolderActionState>(
                  builder: (context, state) {
                    return ElevatedButtonWidget(
                      title: 'Save',
                      isLoading: state is FolderActionLoadingState,
                      onPressed: () {
                              context.read<FolderActionBloc>().add(
                                  SendFolderActionEvent(
                                      folderEventName: FolderEventName.add,
                                      email: userEmailController.text,
                                      folderId: widget.folderId,
                                      userId: null
                                  ));
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
