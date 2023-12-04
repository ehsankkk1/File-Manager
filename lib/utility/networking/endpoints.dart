
class EndPoints{

  // my wifi ip address
  static const String kMainUrl = "http://192.168.1.39:3333";
  static const String kMainUrlAssets = "http://localhost:3311";
  static const String login = "/auth/signin";
  static const String folderCanAccess = "/folders/can-access";
  static String filesByFolderId(int folderId) => "/folders/$folderId/files";


}