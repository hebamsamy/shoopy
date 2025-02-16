import 'package:flutter/material.dart';

class NOConnectionScreen extends StatelessWidget {
  const NOConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            "https://th.bing.com/th/id/OIP.6QxSoqcVmb3K-rSxmKq1_gHaH0?w=163&h=180&c=7&r=0&o=5&pid=1.7"),
      ),
    );
  }
}
