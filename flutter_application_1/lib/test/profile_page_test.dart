import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/test/edit_profile_test.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';


class ProfilePageTest extends StatefulWidget {
  const ProfilePageTest({super.key});

  @override
  State<ProfilePageTest> createState() => _ProfilePageTestState();
}

class _ProfilePageTestState extends State<ProfilePageTest> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  void initState() {
    super.initState();
    _currentUser.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 56, 18, 194),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(width: 15,),
                        Text("Profile",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),)
                      ],
                    ),
                    Container(
                      height: 130,
                      child: Column(
                        children: [
                          Container(
                            width: 85,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/profile2.png"),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Center(
                            child: Text("Student", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23)),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Text("UserName:",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Obx(() => userInfoItemProfile(Icons.account_circle_outlined, _currentUser.user.user_name)),
                              const SizedBox(height: 15,),
                              Text("UserId:",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Obx(() => userInfoItemProfile(Icons.assignment_ind_outlined, _currentUser.user.user_id.toString())),
                              const SizedBox(height: 45,),
                              editProfileButton(),
                              const SizedBox(height: 45,),
                              GestureDetector(
                                onTap: () {
                                  signOutUser();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(255, 155, 4, 4),
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: const Color.fromARGB(255, 201, 61, 56),
                                              ),
                                              width: 60,
                                              height: 90,
                                              child: const Icon(Icons.sign_language_outlined, color: Colors.white, size: 30,),
                                            ),
                                          ),
                                          const Text("SignOut", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 30,),
                                      )
                                    ],
                                  ),
                                ),
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
      ),
    );
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 56, 18, 194),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(iconData, size: 30, color: Colors.white,),
          const SizedBox(width: 16,),
          Text(userData, style: const TextStyle(fontSize: 20, color: Colors.white),)
        ],
      ),
    );
  }

  Widget editProfileButton() {
    return GestureDetector(
      onTap: () {
        Get.to(EditProfilePage());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 42, 7, 122),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 56, 18, 194),
                    ),
                    width: 60,
                    height: 90,
                    child: const Icon(Icons.border_color_outlined, color: Colors.white, size: 30,),
                  ),
                ),
                const Text("Edit Profile", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),)
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 30,),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signOutUser() async {
    var resultRes = await Get.dialog(
      AlertDialog(
        backgroundColor: const Color.fromARGB(255, 33, 68, 243),
        title: const Text(
          "LogOut",
          style: TextStyle(
            color: Color.fromARGB(185, 255, 255, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        content: const Text(
          "Are you sure?\nyou want to log out from the app?",
          style: TextStyle(color: Color.fromARGB(164, 255, 255, 255), fontSize: 12),
        ),
        actions: [
          TextButton(onPressed: () { Get.back(); }, child: const Text("No",style: TextStyle(color: Colors.white54),)),
          TextButton(onPressed: () { Get.back(result: "loggedOut"); }, child: const Text("Yes",style: TextStyle(color: Colors.white54))),
        ],
      ),
    );

    if (resultRes == "loggedOut") {
      await RemeberUsersPrefs.removeUserInfo().then((value) {
        Get.off(LoginPage());
      });
    }
  }
}
