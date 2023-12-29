import 'package:file_manager/features/folder/domain/entities/folder_entity.dart';
import 'package:file_manager/features/folder/presentation/bloc/folder_users_bloc/folder_users_bloc.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';
import 'package:file_manager/utility/networking/network_helper.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';
import '../../../auth/domain/entities/user_entity.dart';

class FolderDataSource {
  FolderDataSource(this.networkHelpers);
  NetworkHelpers networkHelpers;

  Future getCanAccessFolderData({
    required GetCanAccessFolderEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.folderCanAccess,
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return folderEntityFromJson(helperResponse.response);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  Future getMyFolderData({
    required GetMyFolderEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.myFolders,
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return folderEntityFromJson(helperResponse.response);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }

  Future getFolderUsers({
    required GetFolderUsersEvent event,
  }) async {
    HelperResponse helperResponse = await NetworkHelpers.getDeleteDataHelper(
      url: EndPoints.folderUsers(event.folderId),
      useUserToken: true,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        return userListFromJson(helperResponse.response);
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}
