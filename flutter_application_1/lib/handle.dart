import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Handle extends StatelessWidget {
  final Future<FirebaseApp> firebasetest = Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: firebasetest, builder: (context,snapshot){
      if (snapshot.hasError) {
        return const Scaffold(body: Center(child: Text('Firebase is not connected'),),);
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,Streamsnapshot){
          if (Streamsnapshot.hasError) {
            return Scaffold(body: Center(child: Text("${Streamsnapshot.error}"),),);
          }
          if (Streamsnapshot.connectionState == ConnectionState.active) {
           User? username = Streamsnapshot.data;
           if (username == null) {
             return const LoginPage();
           } else {
            // FirebaseAuth.instance.signOut();
            return HomePage();
            // FirebaseAuth.instance.signInAnonymously();
           }
          }
          return const CircularProgressIndicator();
        });
      }
      return const CircularProgressIndicator();
    });
  }
}