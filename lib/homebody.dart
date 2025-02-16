import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Product").snapshots(),
      builder: (context,snapshots){
        print(snapshots.hasData);
        if(snapshots.connectionState == ConnectionState.done ||snapshots.connectionState == ConnectionState.active ){
          return ListView(
            children: snapshots.data!.docs.map((item)=>Text(item.get("Name"))).toList(),
          );
        }
        else{
          return Center(child: Text("NO YET"),);
        }
      });
  }
}