import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/homescreen.dart';
import 'package:shoopy/loginscreen.dart';
import 'package:shoopy/noconnectionscreen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
    future: Firebase.initializeApp(), 
    builder: (context, db){
      if (db.connectionState == ConnectionState.done) {
        return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, user){
          if(user.hasData){
            //user already logged in
            return HomeScreen();
          }
          else{
            return LoginScreen();
          }
        });
      } else {
        return NOConnectionScreen();
      }
    });
  }
}