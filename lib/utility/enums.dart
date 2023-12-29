
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ServicesResponseStatues {
  success,
  networkError,
  savedToLocal,
  someThingWrong,
  modelError,
  wrongData,
  locationError,
}
enum FileEventName{
  updated,
  deleted,
  created,
  checkedIn,
  checkedOut,
}
enum FolderEventName{
  updated,
  deleted,
  created,
  add,
  remove,
}

final EnumValues serviceValues = EnumValues({
  "Sent Successfully": ServicesResponseStatues.success,
  "Connection error !": ServicesResponseStatues.networkError,
  "Something went wrong !": ServicesResponseStatues.someThingWrong,
  "Failed to parse model !": ServicesResponseStatues.modelError,
  "Data sent is not correct !": ServicesResponseStatues.wrongData,
  "The form is saved locally": ServicesResponseStatues.savedToLocal,
  "No Location Permission !": ServicesResponseStatues.locationError
});
final eventNameValues = EnumValues({
  "checkedin": FileEventName.checkedIn,
  "checkedout": FileEventName.checkedOut,
  "created": FileEventName.created,
  "updated": FileEventName.updated,
  "deleted": FileEventName.deleted,
});
final eventNameValuesUI = EnumValues({
  "Checked In": FileEventName.checkedIn,
  "Checked Out": FileEventName.checkedOut,
  "Created": FileEventName.created,
  "Updated": FileEventName.updated,
  "Deleted": FileEventName.deleted,
});
IconData getFileEventNameIcon(FileEventName fileEventName){
  if(fileEventName ==  FileEventName.checkedIn){
    return Icons.input_rounded;
  }
  if(fileEventName ==  FileEventName.checkedOut){
    return Icons.output_rounded;
  }
  if(fileEventName ==  FileEventName.created){
    return Icons.add;
  }
  if(fileEventName ==  FileEventName.updated){
    return Icons.edit;
  }
  if(fileEventName ==  FileEventName.updated){
    return Icons.edit;
  }
  return Icons.delete_forever;
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
