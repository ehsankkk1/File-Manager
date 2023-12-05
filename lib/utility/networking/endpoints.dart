
class EndPoints{

  // my wifi ip address
  static const String kMainUrl = "http://192.168.108.228:3333";
  static const String kMainUrlAssets = "http://192.168.108.228:3333";
  static const String login = "/auth/signin";
  static const String folderCanAccess = "/folders/can-access";
  static String filesByFolderId(int folderId) => "/folders/$folderId/files";


}