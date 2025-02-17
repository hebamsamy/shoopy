import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String password = "";
  bool remmeber = false;
  register() {
    print(email);
    print(password);
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userData) async {
          await userData.user?.updatePhotoURL("https://th.bing.com/th/id/OIP.sZiyycyNhTGRBdF8g0tgTgHaHa?rs=1&pid=ImgDetMain");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Register Successfully, login now")));
      Navigator.of(context).pushNamed("login");
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Fill your information below or register with your social account.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter your Email", border: OutlineInputBorder()),
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  border: OutlineInputBorder()),
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: register,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0XFF8E5134),
                      // border: Border.all(color: Color(0XFF8E5134)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 70,
                    child: Divider(
                      thickness: 2,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or Continue With",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                    width: 70,
                    child: Divider(
                      thickness: 2,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 10, 6, 4)),
                        borderRadius: BorderRadius.circular(3)),
                    child: Image.asset("images/face.png")),
                Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 10, 6, 4)),
                        borderRadius: BorderRadius.circular(3)),
                    child: Image.asset("images/google.png"))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Color(0XFF8E5134)))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
