import 'package:hive/hive.dart';

import '../configs/constant_varible.dart';

class HiveService {
  late Box boxData = Hive.box(boxAppSettingName);
  late Box boxAPIData = Hive.box(boxAPIName);
  String getLanguage(){
    String lang = boxData.get("language", defaultValue: defaultLanguage);
    return lang;
  }

  String updateLanguage(String lang) {
    boxData.put("language", lang);
    return boxData.get("language", defaultValue: defaultLanguage);
  }

  bool getSwitchMethod() {
    bool isActive = boxData.get("method",defaultValue: false);
    return isActive;
  }

  bool updateSwitchMethod(bool isActive) {
    boxData.put("method", isActive);
    return boxData.get("method", defaultValue: isActive);
  }

  String? getAccessToken() {
    String? res = boxAPIData.get(accessTokenDataName);
    return res;
  }

  String? updateToken(String token) {
    boxAPIData.put(accessTokenDataName, token);
    return getAccessToken();
  }

  String? getUserID() {
    String? res = boxAPIData.get(userIdName);
    return res;
  }

  String? updateUserID(String id) {
    boxAPIData.put(userIdName, id);
    return getUserID();
  }

  void removeToken() {
    boxAPIData.delete(accessTokenDataName);
  }

  String? getRefreshToken() {
    String res = boxAPIData.get(refreshTokenDataName);
    return res;
  }

  void removeReToken() {
    boxAPIData.delete(accessTokenDataName);
  }

    void removeUserID() {
    boxAPIData.delete(userIdName);
  }

  String? updateRefreshToken(String token) {
    boxAPIData.put(refreshTokenDataName, token);
    return getRefreshToken();
  }
}