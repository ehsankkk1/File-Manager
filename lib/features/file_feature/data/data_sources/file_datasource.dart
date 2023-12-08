import 'package:file_manager/features/file_feature/presentation/bloc/file_action_bloc/file_action_bloc.dart';
import 'package:file_manager/features/file_feature/presentation/bloc/file_list_bloc/file_bloc.dart';
import 'package:file_manager/utility/networking/network_helper.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';
import '../../domain/entities/file_entity.dart';

class FileDataSource {
  FileDataSource(this.networkHelpers);
  NetworkHelpers networkHelpers;

  Future getFilesByFolderIdDataSource({
    required GetFilesByFolderIdEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.filesByFolderId(event.folderId),
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return fileEntityFromJson(helperResponse.response);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  Future addFileDataSource({
    required AddEditFileActionEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
        url: EndPoints.uploadFile(event.folderId),
        useUserToken: true,
        body: {"title": event.title},
        files: event.file != null ?[event.file!] : []
    );

    return helperResponse;
  }
  Future editFileDataSource({
    required AddEditFileActionEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataWithFile(
        crud: "PATCH",
        url: EndPoints.editFile(event.folderId,event.fileId!),
        useUserToken: true,
        body: {"title": event.title},
        files: event.file != null ?[event.file!] : []
    );

    return helperResponse;
  }

  Future checkInFileDataSource({
    required SendFileNewActionEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      crud: "PATCH",
      url: EndPoints.checkInFile(event.folderId, event.fileId),
      useUserToken: true,
    );

    return helperResponse;
  }

  Future checkOutFileDataSource({
    required SendFileNewActionEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      crud: "PATCH",
      url: EndPoints.checkOutFile(event.folderId, event.fileId),
      useUserToken: true,
    );

    return helperResponse;
  }

  Future deleteFileDataSource({
    required SendFileNewActionEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.postDataHelper(
      crud: "DELETE",
      url: EndPoints.deleteFile(event.folderId, event.fileId),
      useUserToken: true,
    );

    return helperResponse;
  }
}
