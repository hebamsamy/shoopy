import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/addproductscreen.dart';
import 'package:shoopy/homescreen.dart';
import 'package:shoopy/initscreen.dart';
import 'package:shoopy/loginscreen.dart';
import 'package:shoopy/registerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "init",
      routes: {
        "init": (context) => InitScreen(),
        "home": (context) => HomeScreen(),
        "add-product": (context) => AddProductScreen(),
        "register": (context) => RegisterScreen(),
        "login": (context) => LoginScreen(),
      },
    );
  }
}
