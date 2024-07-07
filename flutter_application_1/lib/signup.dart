import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/api_connection/api_connection.dart';
import 'package:flutter_application_1/userPerfrences/shared_prefs.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool loading = false;
  bool passwordObscured = true;
  bool confirmPasswordObscured = true;
  bool showError = false;
  String errorMessage = "";
  bool showSuccessMessage = false;

  String get username => _usernameController.text.trim();
  String get password => _passwordController.text.trim();
  String get confirmPassword => _confirmPasswordController.text.trim();

  Future<bool> checkUsernameAvailability(String username) async {
    try {
      var res = await http.post(
        Uri.parse('http://192.168.201.48/api_clothes_store/user/check_username_availability.php'),
        body: jsonEncode({"username": username}),
        headers: {"Content-Type": "application/json"},
      );

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        return !resBody['taken'];
      } else {
        throw Exception("Failed to check username availability");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred while checking username availability.");
      return false;
    }
  }

  Future<void> registerUser() async {
    if (password != confirmPassword) {
      setState(() {
        showSuccessMessage = false;
        errorMessage = "Passwords do not match";
        showError = true;
      });
      return;
    }

    bool isUsernameAvailable = await checkUsernameAvailability(username);
    if (!isUsernameAvailable) {
      setState(() {
        showSuccessMessage = false;
        errorMessage = "Username is already taken";
        showError = true;
      });
      return;
    }

    if (!isValidPassword(password)) {
      setState(() {
        showSuccessMessage = false;
        errorMessage = "Password must be at least 8 characters long, include uppercase, lowercase, and a number.";
        showError = true;
      });
      return;
    }

    setState(() {
      loading = true;
      showError = false;
    });

    try {
      var res = await http.post(
         Uri.parse('http://192.168.201.48/api_clothes_store/user/signup.php'),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['success'] == true) {
          Fluttertoast.showToast(msg: "Sign up successful");
          User userInfo = User.fromJson(resBody["userdata"]);
          await RemeberUsersPrefs.storeUserInfo(userInfo);
          Get.to(LoginPage());
        } else {
          setState(() {
            showSuccessMessage = false;
            errorMessage = "Signup failed. Please try again.";
            showError = true;
          });
        }
      } else {
        setState(() {
          showSuccessMessage = false;
          errorMessage = "Unexpected error occurred. Please try again.";
          showError = true;
        });
      }
    } catch (e) {
      setState(() {
        showSuccessMessage = true;
        errorMessage = "Signup Successfully\nGo to Login Page And Login";
        showError = true;
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow the bottom inset to avoid overflow
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 56, 18, 194),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "Sign Up.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.87,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Image.asset("assets/cap.png"),
                          ),
                          const SizedBox(height: 1),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                  right: 20,
                                  left: 20,
                                ),
                                child: const Text(
                                  "Username",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(26, 124, 120, 120),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                controller: _usernameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                  right: 20,
                                  left: 20,
                                ),
                                child: const Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(26, 124, 120, 120),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: passwordObscured,
                                obscuringCharacter: ".",
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordObscured = !passwordObscured;
                                      });
                                    },
                                    icon: Icon(
                                      passwordObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                  right: 20,
                                  left: 20,
                                ),
                                child: const Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(26, 124, 120, 120),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                controller: _confirmPasswordController,
                                obscureText: confirmPasswordObscured,
                                obscuringCharacter: ".",
                                decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        confirmPasswordObscured = !confirmPasswordObscured;
                                      });
                                    },
                                    icon: Icon(
                                      confirmPasswordObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (showError) ...[
                            const SizedBox(height: 1),
                            if (!showSuccessMessage)
                             Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (showSuccessMessage)
                            Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 66, 212, 119),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Color.fromARGB(255, 57, 163, 34), fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              registerUser();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 56, 18, 194),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: !loading,
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: loading,
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? "),
                              InkWell(
                                onTap: () {
                                  Get.to(() => LoginPage());
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
