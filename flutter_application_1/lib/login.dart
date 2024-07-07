import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/userPerfrences/shared_prefs.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/api_connection/api_connection.dart';
import 'package:flutter_application_1/model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;
  bool showError = false; // To track if there's an error
  String errorMessage = ""; // To hold the error message

  bool passwordObscured = true;

  String get username => _usernameController.text.trim();
  String get password => _passwordController.text.trim();

  Future<void> loginUserNow() async {
    setState(() {
      loading = true;
      showError = false; // Hide error message on new attempt
    });

    try {
      var res = await http.post(
        Uri.parse(api.Login),
        body: {
          "user_name": username,
          "user_password": password,
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "Login successfully");
          User userInfo = User.fromJson(resBodyOfLogin["userdata"]);
          await RemeberUsersPrefs.storeUserInfo(userInfo);
          Get.to(HomePage());
        } else {
          // Show error message if login fails
          setState(() {
            errorMessage = "Incorrect username or password";
            showError = true;
          });
        }
      } else {
        setState(() {
          errorMessage = "Unexpected error occurred. Please try again.";
          showError = true;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred. Please try again.";
        showError = true;
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 56, 18, 194),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15),
                      Text(
                        "Log In.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Image.asset("assets/cap.png"),
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
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
                                  obscuringCharacter: ".",
                                  obscureText: passwordObscured,
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
                            if (showError) ...[
                              const SizedBox(height: 10),
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(color: Colors.red, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25, top: 10),
                                    child: Container(
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                loginUserNow();
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
                                          "Login",
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? "),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => SignUpPage());
                                  },
                                  child: Text(
                                    "Sign Up",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
