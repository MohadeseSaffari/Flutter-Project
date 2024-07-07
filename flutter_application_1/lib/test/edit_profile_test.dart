import 'package:flutter/material.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final CurrentUser _currentUser = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _currentUser.user.user_name;
  }

  Future<void> _updateProfile() async {
    final response = await http.post(
      Uri.parse('http://192.168.201.48/api_clothes_store/user/update_user.php'),
      body: {
        'user_id': _currentUser.user.user_id.toString(),
        'user_name': _nameController.text,
      },
    );

    if (response.statusCode == 200) {
      _currentUser.getUserInfo();
      Fluttertoast.showToast(msg: "Update successful");
      Get.back();
    } else {
      Fluttertoast.showToast(msg: "Failed to update profile.");
    }
  }

  Future<void> _changePassword() async {
    final response = await http.post(
      Uri.parse('http://192.168.201.48/api_clothes_store/user/change_password.php'),
      body: {
        'user_id': _currentUser.user.user_id.toString(),
        'old_password': _oldPasswordController.text,
        'new_password': _newPasswordController.text,
      },
    );

    if (response.statusCode == 200) {
      var resBody = jsonDecode(response.body);
      if (resBody['success']) {
        Fluttertoast.showToast(msg: "Password changed successfully");
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "Failed to change password");
      }
    } else {
      Fluttertoast.showToast(msg: "Failed to change password.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white70)),
        backgroundColor: Color(0xff402fcc),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile2.png'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff402fcc),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
