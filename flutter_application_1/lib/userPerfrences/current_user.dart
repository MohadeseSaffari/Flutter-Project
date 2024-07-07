import 'dart:convert';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrentUser extends GetxController {
  Rx<User> _currentUser = User(0, '', '').obs;
  User get user => _currentUser.value;

  Future<void> getUserInfo() async {
    User? getUserInfoFromLS = await RemeberUsersPrefs.readUserInfo();
    if (getUserInfoFromLS != null) {
      _currentUser.value = getUserInfoFromLS;
    }

    // Fetch user data from API
    try {
      var response = await http.get(Uri.parse('http://192.168.201.48/api_clothes_store/user/fetch_user.php?user_id=${_currentUser.value.user_id}'));

      if (response.statusCode == 200) {
        var responseBody = response.body;

        // Print the response body for debugging
        print('Response body: $responseBody');

        // Check if response body is empty
        if (responseBody.isEmpty) {
          print('Response body is empty.');
          return;
        }

        // Check if response body is valid JSON
        try {
          var data = jsonDecode(responseBody);
          _currentUser.value = User.fromJson(data);

          // Store updated user data in local storage
          await RemeberUsersPrefs.storeUserInfo(_currentUser.value);
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      } else {
        print('Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}


//       var data = jsonDecode(response.body);
//       _currentUser.value = User.fromJson(data);

//       // Store updated user data in local storage
//       await RemeberUsersPrefs.storeUserInfo(_currentUser.value);
//     }
//   }
// }


