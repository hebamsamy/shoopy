import 'package:flutter/material.dart';
import 'package:shoopy/models/product.dart';

class ProductCard extends StatelessWidget {
  Product prd;
  ProductCard({required this.prd});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        prd.img,
        fit: BoxFit.fill,
      ),
      footer: GridTileBar(
        backgroundColor: const Color.fromARGB(138, 158, 158, 158),
        title: Text(prd.name, style: TextStyle(fontSize: 20),),
        trailing: Text("${prd.price} \$", style:  TextStyle(color: Colors.white),),
      ),
    );
  }
}
