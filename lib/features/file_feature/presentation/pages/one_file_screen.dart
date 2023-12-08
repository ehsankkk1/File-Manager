import 'dart:io';

import 'package:file_manager/features/file_feature/domain/entities/file_entity.dart';
import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';
import 'package:file_manager/utility/dialogs_and_snackbars/dialogs_snackBar.dart';
import 'package:file_manager/utility/global_widgets/elevated_button_widget.dart';
import 'package:file_manager/utility/networking/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../utility/enums.dart';
import '../../../../utility/theme/color_style.dart';
import '../../../../utility/theme/text_styles.dart';
import '../widgets/file_action_widget.dart';
import '../widgets/file_eventName_widget.dart';

class OneFileScreen extends StatelessWidget {
  OneFileScreen({required this.fileEntity, Key? key}) : super(key: key);
  FileEntity fileEntity;

  @override
  Widget build(BuildContext context) {
    void sendFileActionEvent(FileEventName fileEventName) {
      context.read<FileActionBloc>().add(SendFileNewActionEvent(
          fileEventName: fileEventName,
          folderId: fileEntity.folderId,
          fileId: fileEntity.id));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kSecondColor,
        title: Text(
          fileEntity.title,
          style:
              AppFontStyles.boldH2.copyWith(color: AppColors.kBackGroundColor),
        ),
      ),
      body: BlocListener<FileActionBloc, FileActionState>(
        listener: (context, state) {
          if(state is FileActionResponseState){
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
                helperResponse: state.helperResponse,
              popOnSuccess: true,
              showServerError: true,
            );
          }
        },
        child: ListView(
          padding: EdgeInsets.only(
              left: screenWidth * 0.038,
              right: screenWidth * 0.038,
              top: screenHeight * 0.07,
              bottom: screenHeight * 0.02),
          children: [
            CircleAvatar(
              backgroundColor: fileEntity.isAvailable
                  ? AppColors.kGreenColor
                  : AppColors.redColor,
              radius: 75,
              child: const Icon(
                Icons.file_copy_rounded,
                size: 60,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fileEntity.title,
                  style: AppFontStyles.mediumH2,
                ),
                if (fileEntity.isAvailable)
                  Text(
                    "Available",
                    style: AppFontStyles.boldH3
                        .copyWith(color: AppColors.kGreenColor),
                  )
                else
                  Text(
                    "Not Available",
                    style: AppFontStyles.boldH3
                        .copyWith(color: AppColors.redColor),
                  )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "File Creator",
                  style: AppFontStyles.mediumH2,
                ),
                Text(
                  fileEntity.user.email,
                  style: AppFontStyles.regularH2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CheckedIn By",
                  style: AppFontStyles.mediumH2,
                ),
                Text(
                  fileEntity.checkedInUser?.email ?? 'No one',
                  style: AppFontStyles.regularH2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<FileActionBloc, FileActionState>(
              builder: (context, state) {
                if (state is FileActionLoadingState) {
                  return const SizedBox(
                      height: 200, child: Center(child: CircularProgressIndicator()));
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          FileActionWidget(
                            title: 'Check In',
                            onPressed: () {
                              sendFileActionEvent(FileEventName.checkedIn);
                            },
                            icon: getFileEventNameIcon(FileEventName.checkedIn),
                          ),
                          SizedBox(
                            width: screenWidth * 0.038,
                          ),
                          FileActionWidget(
                            title: 'Check Out',
                            onPressed: () {
                              sendFileActionEvent(FileEventName.checkedOut);
                            },
                            icon:
                                getFileEventNameIcon(FileEventName.checkedOut),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.038,
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          FileActionWidget(
                            title: 'Edit',
                            onPressed: () {},
                            icon: getFileEventNameIcon(FileEventName.updated),
                          ),
                          SizedBox(
                            width: screenWidth * 0.038,
                          ),
                          FileActionWidget(
                            title: 'Delete',
                            onPressed: () {
                              sendFileActionEvent(FileEventName.deleted);
                            },
                            icon: getFileEventNameIcon(FileEventName.deleted),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: screenWidth * 0.038,
            ),
            ElevatedButtonWidget(
              title: "Download",
              onPressed: () async {
                String? dir = (await getDownloadsDirectory())?.path;
                await downloadFile(
                        url: "${EndPoints.kMainUrlAssets}/${fileEntity.link}",
                        fileName: "1701813257860-528025700.jpeg",
                        dir: dir ?? "")
                    .then((value) {
                  if (value) {
                    DialogsWidgetsSnackBar.showScaffoldSnackBar(
                        title: "Success in downloads of app data",
                        color: AppColors.kGreenColor,
                        context: context);
                  } else {
                    DialogsWidgetsSnackBar.showScaffoldSnackBar(
                        title: "Download Failed", context: context);
                  }
                });
              },
            ),
            SizedBox(
              height: screenWidth * 0.1,
            ),
            const Text(
              "Files Events",
              style: AppFontStyles.mediumH1,
            ),
            SizedBox(
              height: screenWidth * 0.038,
            ),
            Column(
              children: List.generate(
                  fileEntity.fileEvent.length,
                  (index) => FileEventNameWidget(
                        fileEventEntity: fileEntity.fileEvent[index],
                        index: index,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> downloadFile(
    {required String url,
    required String fileName,
    required String dir}) async {
  HttpClient httpClient = HttpClient();
  File file;
  String filePath = '';

  try {
    await Permission.storage.request();

    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = '$dir/$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);
      print('File downloaded to: $filePath');
      return true;
    } else {
      filePath = 'Error code: ${response.statusCode}';
      return false;
    }
  } catch (ex) {
    filePath = 'Can not fetch url';
    print(ex);
    return false;
  }
}
