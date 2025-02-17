import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return ListView(
      children: [
        Text(
          "Settings",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 100,
          child:Image.network(user.photoURL!),
          // backgroundImage:NetworkImage(user.photoURL!),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          user.email!,
          style: TextStyle(fontSize: 30),
        ),
        
        SizedBox(
          height: 20,
        ),
        ListTile(
          trailing: Icon(Icons.logout_outlined),
          title: Text("Logout"),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:  Text("Are You Sure To Log Out ?????"),
                    actions:  [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: Text("Cancel")),
                          OutlinedButton(onPressed: () async{
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pop();

                          }, child: Text("Logout"))
                        ],
                  );
                });
          },
        )
      ],
    );
  }
}
