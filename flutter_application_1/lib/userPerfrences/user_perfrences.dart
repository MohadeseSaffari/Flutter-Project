import 'dart:convert';

import 'package:flutter_application_1/model/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RemeberUsersPrefs {
  //save-rember userInfo
  static Future<void> storeUserInfo(User userInfo) async{ 
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String userJsonData = jsonEncode(userInfo.toJson());
      await preferences.setString("currentUser", userJsonData);
  }
  //get-read userInfo
  static Future<User?> readUserInfo() async{
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    if (userInfo != null) {
      Map<String,dynamic> userDataMap = jsonDecode((userInfo));
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
  //remove user while signout
  static Future<void> removeUserInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}