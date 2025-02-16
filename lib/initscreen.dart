import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/homescreen.dart';
import 'package:shoopy/noconnectionscreen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
    future: Firebase.initializeApp(), 
    builder: (context, db){
      if (db.connectionState == ConnectionState.done) {
        return HomeScreen();
      } else {
        return NOConnectionScreen();
      }
    });
  }
}