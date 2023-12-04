import 'package:file_manager/features/file_feature/presentation/bloc/file_bloc.dart';
import 'package:file_manager/utility/networking/network_helper.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/networking/endpoints.dart';
import '../../domain/entities/file_entity.dart';

class FileDataSource {
  FileDataSource(this.networkHelpers);
  NetworkHelpers networkHelpers;

  Future getFilesByFolderId({
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
}
