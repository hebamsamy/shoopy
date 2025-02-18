import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/Widgets/productcard.dart';
import 'package:shoopy/models/product.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Product").snapshots(),
      builder: (context,snapshots){
        print(snapshots.hasData);
        if(snapshots.connectionState == ConnectionState.done ||snapshots.connectionState == ConnectionState.active ){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // width/height
                childAspectRatio: 1/1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                ),
              children: snapshots.data!.docs.map((item){
                Product temp = Product() ;
                temp.img = item.get("Img");
                temp.name = item.get("Name");
                temp.price = item.get("Price");
                temp.qty = item.get("Qty");
                return ProductCard(prd: temp);
              }).toList(),
            ),
          );
        }
        else{
          return Center(child: Text("NO YET"),);
        }
      });
  }
}