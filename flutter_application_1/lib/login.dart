import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


// import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscured = true;
  void login(String email,String password){
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        setState(() {
          loading = false;
        });
        Alert(context: context, title: "Network request Falied!", desc: e.message).show();
      }else if(e.code == "wrong-password"){
        setState(() {
          loading = false;
        });
        Alert(context: context, title: "Wrong Password!", desc: e.message).show();
      }else if(e.code == "user-not-found"){
        setState(() {
          loading = false;
        });
        Alert(context: context, title: "User doesen't exists!", desc: e.message).show();
      }else if(e.code == "unknown"){
        setState(() {
          loading = false;
        });
        Alert(context: context, title: "Please try again", desc: e.message).show();
      }
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  SizedBox(width: 15,),
                  Text("Log In.",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),)
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
                          Container(
                              margin: 
                                const EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(color: Color.fromARGB(26, 124, 120, 120),
                                borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: TextField(
                                    controller: _usernameController,
                                    // autofocus: ture,  -khodesh keyboard ro baz mikone
                                    // maxLength: , -bishtar az yek meghdari ejaze neveshtan nemidahad
                                    keyboardType: TextInputType.emailAddress, //-keyboard adad baz mikone
                                    // obscuringCharacter: "*",
                                    // obscureText: true, -textemon ro bu star hide mikone
                                    decoration: InputDecoration(labelText: " Username",border: InputBorder.none,prefixIcon: Icon(Icons.person)),
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
                          Container(
                              margin: 
                                const EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(color: Color.fromARGB(26, 124, 120, 120),
                                borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: TextField(
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
                                  ),
                                ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25,top: 10),
                                child: Container(child: const Text("Forgot Password?" , style: TextStyle(color: Colors.blueAccent),),),
                              ))
                          ],
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                loading = true;
                              });
                              login(username, password);
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
                                  child: Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: loading ? false : true,
                                        child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),
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
                              Text("Dont have account? "),
                              InkWell(
                                onTap: () {
                                  Get.to(SignUpPage());
                                },
                                child: Text("Sign Up" , style: TextStyle(color: Colors.blue),),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],)),   
      );
  }
}