import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/handle.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(child: Stack(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    SizedBox(width: 15,),
                    Text("Profile",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),)
                    ],
                  ),
                  Container(
                    height: 130,
                    child: Column(
                      children: [
                        Container(
                          // SizedBox(height: 30,),
                          width:85,
                          child: ClipRRect(borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/profile2.png"),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Text(FirebaseAuth.instance.currentUser!.displayName.toString(),style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23
                          ),),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only
                          (
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 42, 7, 122)),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 70,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 56, 18, 194),
                                          ),
                                            width: 60,
                                            height: 90,
                                            child: Icon(Icons.lock_open,color: Colors.white,size: 30,),    
                                        ),
                                      ),
                                      Text("Change Password",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                                  )
                                ],),
                              ),
                            ),SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 42, 7, 122)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 70,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 56, 18, 194),
                                        ),
                                          width: 60,
                                          height: 90,
                                          child: Icon(Icons.edit,color: Colors.white,size: 30,),    
                                      ),
                                    ),
                                    Text("Edit Profile",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                                )
                              ],),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 42, 7, 122)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 70,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 56, 18, 194),
                                        ),
                                          width: 60,
                                          height: 90,
                                          child: Icon(Icons.phone,color: Colors.white,size: 30,),    
                                      ),
                                    ),
                                    Text("Call Us",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                                )
                              ],),
                            ),
                            SizedBox(height: 150,),
                            GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance.signOut();
                                Get.to(LoginPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 155, 4, 4)),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 70,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 201, 61, 56),
                                          ),
                                            width: 60,
                                            height: 90,
                                            child: Icon(Icons.sign_language_outlined,color: Colors.white,size: 30,),    
                                        ),
                                      ),
                                      Text("SignOut",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                                  )
                                ],),
                              ),
                            ),
                          ],
                          
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],)),
      ),   
      );
  }
}