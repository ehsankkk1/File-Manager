import 'dart:io';
import 'package:file_manager/utility/dialogs_and_snackbars/dialogs_snackBar.dart';
import 'package:file_manager/utility/global_widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utility/enums.dart';
import '../../../../utility/global_widgets/elevated_button_widget.dart';
import '../../../../utility/theme/app_borders.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/file_action_bloc/file_action_bloc.dart';

class AddFileDialogWidget extends StatefulWidget {
  AddFileDialogWidget(
      {required this.folderId, this.title, this.fileId, Key? key})
      : super(key: key);
  int folderId;
  int? fileId;
  String? title;
  @override
  State<AddFileDialogWidget> createState() => _AddFileDialogWidgetState();
}

class _AddFileDialogWidgetState extends State<AddFileDialogWidget> {
  late TextEditingController fileTitleController;
  File? filePicked;

  @override
  void initState() {
    fileTitleController = TextEditingController(text: widget.title);
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
                  label: "Title",
                  controller: fileTitleController,
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      setState(() {
                        filePicked = File(result.files.single.path!);
                      });
                    }
                  },
                  child: CustomTextField(
                    label: "Add Image",
                    enabled: false,
                    hintText: filePicked?.path ?? 'No File',
                    controller: null,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<FileActionBloc, FileActionState>(
                  builder: (context, state) {
                    return ElevatedButtonWidget(
                      title: 'Save',
                      isLoading: state is FileActionLoadingState,
                      onPressed: () {
                        if (filePicked == null && widget.fileId == null) {
                          return DialogsWidgetsSnackBar.showScaffoldSnackBar(
                              title: "Add File", context: context);
                        }

                        context
                            .read<FileActionBloc>()
                            .add(AddEditFileActionEvent(
                              fileEventName: FileEventName.created,
                              folderId: widget.folderId,
                              fileId: widget.fileId,
                              file: filePicked,
                              title: fileTitleController.text,
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

// class AddFileBottomSheet {
//   static void showLanguageBottomSheet({
//     required TextEditingController controller,
//     required File? file,
//     required BuildContext context,
//     required Function() save,
//   }) {
//     double getWidth = MediaQuery.of(context).size.width;
//     double getHeight = MediaQuery.of(context).size.height;
//     var alertDialog = Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(15),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: getHeight * 0.01,
//           ),
//           child: Container(
//             width: double.infinity,
//             decoration: const BoxDecoration(
//                 borderRadius: AppBorders.k15BorderRadius,
//                 color: AppColors.kBackGroundColor),
//             padding: EdgeInsets.fromLTRB(getWidth * 0.038, getWidth * 0.1,
//                 getWidth * 0.038, getWidth * 0.038),
//             child: Wrap(
//               spacing: 10,
//               children: [
//                 CustomTextField(
//                   label: "Title",
//                   controller: controller,
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     FilePickerResult? result =
//                         await FilePicker.platform.pickFiles();
//                     if (result != null) {
//                       file = File(result.files.single.path!);
//                     }
//                   },
//                   child: CustomTextField(
//                     label: "Add Image",
//                     enabled: false,
//                     hintText: file?.path ?? 'No File',
//                     controller: null,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 ElevatedButtonWidget(
//                   title: 'Save',
//                   onPressed: save,
//                 ),
//               ],
//             ),
//           ),
//         ));
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alertDialog;
//         });
//   }
// }
