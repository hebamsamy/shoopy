import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/models/product.dart';
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Product prd = Product();
  var key = GlobalKey<FormState>();
  var db = FirebaseFirestore.instance;
  save(){
    key.currentState!.save();
    db.collection("Product").add({
      "Name" :prd.name,
      "Price" :prd.price,
      "Qty" :prd.qty,
      "Img" :prd.img,
    }).then((data){
      print(data.id);
    }).catchError((err){
      print(err);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"),),
      body: Form(
        key:key , child:  ListView(
        children: [
          TextFormField(
            initialValue: prd.name,
            onSaved: (newValue) {
            setState(() {
              prd.name = newValue!;
            });
          }, decoration: InputDecoration(label: Text("Product Name")),),
          TextFormField(onSaved: (newValue) {
            setState(() {
              prd.price = double.parse(newValue!);
            });
          }, decoration: InputDecoration(label: Text("Product Price")),),
          TextFormField(onSaved: (newValue) {
            setState(() {
              prd.qty = int.parse(newValue!);
            });
          }, decoration: InputDecoration(label: Text("Product Quantity")),),
          TextFormField(onSaved: (newValue) {
            setState(() {
              prd.img = newValue!;
            });
          }, decoration: InputDecoration(label: Text("Product Image Link")),),
        
          ElevatedButton(onPressed: save, child: Text("Save Product Data"))
        ],
      )),
    );
  }
}

