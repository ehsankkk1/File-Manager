import 'package:file_manager/features/folder/domain/entities/folder_entity.dart';
import 'package:file_manager/features/folder/presentation/bloc/get_folders_bloc/folder_bloc.dart';
import 'package:file_manager/utility/networking/network_helper.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';

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
}
