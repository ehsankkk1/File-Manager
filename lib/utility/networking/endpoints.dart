
class EndPoints{

  // my wifi ip address

  static const String kMainUrl = "http://192.168.1.17:3333";
  static const String kMainUrlAssets = "http://192.168.1.17:3333";
  static const String login = "/auth/signin";
  static const String folderCanAccess = "/folders/can-access";
  static const String myFolders = "/folders/my-folders";

  static String uploadFile(int folderId) => "/folders/$folderId/files";
  static String editFile(int folderId,int fileId) => "/folders/$folderId/files/$fileId";

  static String checkInFile(int folderId,int fileId) => "/folders/$folderId/files/$fileId/checkin";
  static String checkOutFile(int folderId,int fileId) => "/folders/$folderId/files/$fileId/checkout";
  static String deleteFile(int folderId,int fileId) => "/folders/$folderId/files/$fileId";
  static String filesByFolderId(int folderId) => "/folders/$folderId/files";
  static String folderUsers(int folderId) => "/folders/$folderId/users";


}