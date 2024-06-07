import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// final _fromKey = GlobalKey<FormState>();
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordObscured = true;
  void signup(String email,String password) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (FirebaseAuth.instance.currentUser!.email != null) {
        Get.offAll(HomePage());
      }
    } catch (friebaseAuthException) {
      
    }
  }
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;
  String get username =>  _usernameController.text.trim();
  String get password => _passwordController.text.trim();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Stack(
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
                  Text("SignUp.",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),)
                  ],
                ),
                Positioned(top: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.87,
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
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width*0.8,
                            // color: Colors.blue,
                            child: Image.asset("assets/cap.png"),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                margin:const EdgeInsets.only(
                                  bottom: 10,right: 20,left: 20
                                ),
                                child: const Text("Username",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          Form(
                            // key: _fromKey,
                            child: Container(
                                margin: 
                                  const EdgeInsets.only(left: 20,right: 20),
                                  decoration: BoxDecoration(color: Color.fromARGB(26, 124, 120, 120),
                                  borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: TextFormField(
                                      controller: _usernameController,
                                      // autofocus: ture,  -khodesh keyboard ro baz mikone
                                      // maxLength: , -bishtar az yek meghdari ejaze neveshtan nemidahad
                                      //keyboardType: TextInputType.number, //-keyboard adad baz mikone
                                      // obscuringCharacter: "*",
                                      // obscureText: true, -textemon ro bu star hide mikone
                                      decoration: InputDecoration(labelText: " Username",border: InputBorder.none,prefixIcon: Icon(Icons.person)),
                                      // validator: (name) => name!.length < 3 ? 'Name should be at least 3 characters' : null
                                    ),
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Row(
                            children: [
                              Container(
                                margin:const EdgeInsets.only(
                                  bottom: 10,right: 20,left: 20
                                ),
                                child: const Text("Password",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          Form(
                                // key: _fromKey,
                                child: Container(
                                margin: 
                                  const EdgeInsets.only(left: 20,right: 20),
                                  decoration: BoxDecoration(color: Color.fromARGB(26, 124, 120, 120),
                                  borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      // autofocus: ture,  -khodesh keyboard ro baz mikone
                                      // maxLength: , -bishtar az yek meghdari ejaze neveshtan nemidahad
                                      // keyboardType: TextInputType.number, -keyboard adad baz mikone
                                      obscuringCharacter: ".",
                                      obscureText: passwordObscured, //-textemon ro bu star hide mikone
                                      decoration: InputDecoration(labelText: " Password",border: InputBorder.none,prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(onPressed: (){
                                      setState(() {
                                        passwordObscured = !passwordObscured;
                                      });
                                    },
                                    icon: Icon(
                                      passwordObscured ? Icons.visibility_off : Icons.visibility,))
                                      ),
                                      validator: (value){
                                        if (value == null || value.isEmpty) {
                                          return 'please enter your password';
                                        }
                                        if (username.contains(value)) {
                                          return 'password must not contains username';
                                        }
                                        return null;
                                      },
                                      // validator: (value){
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'please enter your password';
                                      //   }
                                      //   if (value.length < 6) {
                                      //     return 'Password must be at least 6 characters long';
                                      //   }
                                      //   return null;
                                      // }
                                    ),
                                  ),
                            ),
                          ),
                          // Row(mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // children: [
                          //   InkWell(
                          //     onTap: () {},
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(left: 25,top: 10),
                          //       child: Container(child: const Text("Forgot Password?" , style: TextStyle(color: Colors.blueAccent),),),
                          //     ))
                          // ],
                          // ),
                          const SizedBox(height: 25,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                loading = true;
                              });
                              // _fromKey.currentState!.validate();
                             signup(username, password); 
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: 
                                  const EdgeInsets.only(left: 20,right: 20),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 56, 18, 194),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  child: Center(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: loading ? false : true,
                                        child: Text("Sign Up",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),
                                        Visibility(
                                        visible: loading ? true : false,
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(color: Colors.white)),
                                        ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? "),
                              InkWell(
                                onTap: () {
                                  Get.to(LoginPage());
                                },
                                child: Text(" Log In" , style: TextStyle(color: Colors.blue),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                )
              ],
            ),
          )
        ],)),   
      );
  }
}