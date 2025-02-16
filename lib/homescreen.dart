import 'package:flutter/material.dart';
import 'package:shoopy/cartbody.dart';
import 'package:shoopy/homebody.dart';
import 'package:shoopy/searchbody.dart';
import 'package:shoopy/settingsbody.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> bodies = [HomeBody(), SearchBody(), CartBody(), SettingsBody()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoopy"),
      ),
      drawer: SafeArea(
          child: Container(
        // width: 400,
        color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Settings",
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              title: Text("Add Product"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("add-product");
              },
            ),
            ListTile(
              title: Text("Add Product"),
            ),
          ],
        ),
      )),
      body: bodies[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: const Color.fromARGB(103, 124, 77, 255),
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "Cart", icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings)),
          ]),
    );
  }
}
