import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool remmeber = false;
  login() {
    print(email);
    print(password);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userData) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Logged in  Successfully")));
      Navigator.of(context).pushNamed("init");
    }).catchError((error) {
      print("error");
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Hi Welcome back! Please log in to access your account.",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: remmeber,
                        onChanged: (val) {
                          setState(() {
                            remmeber = val!;
                          });
                        }),
                    Text(
                      "Remember me",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0XFF8E5134),
                      // border: Border.all(color: Color(0XFF8E5134)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
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
                Navigator.of(context).pushNamed("register");
              },
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Color(0XFF8E5134)))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
