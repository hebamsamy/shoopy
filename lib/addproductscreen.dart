import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoopy/models/product.dart';
import 'package:image_picker/image_picker.dart';
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Product prd = Product();
  var key = GlobalKey<FormState>();
  var db = FirebaseFirestore.instance;
  var picker = ImagePicker();
  File? selectedImage=  null;
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
  choosefromGallary() async{
    var temp=   await picker.pickImage(source: ImageSource.gallery);
    if(temp != null){
      setState(() {
        selectedImage = File(temp.path);
      });
    }

  }
  takePicture() async{
    var temp=   await picker.pickImage(source: ImageSource.camera);
 if(temp != null){
      setState(() {
        selectedImage = File(temp.path);
      });
    }

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
          // TextFormField(onSaved: (newValue) {
          //   setState(() {
          //     prd.img = newValue!;
          //   });
          // }, decoration: InputDecoration(label: Text("Product Image Link")),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 80,
                child: selectedImage == null? Icon(Icons.add): null ,
                backgroundImage: selectedImage != null ? FileImage(selectedImage!) : null ,
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: choosefromGallary, child: Text("Choose from Gallary")),
                  ElevatedButton(onPressed: takePicture, child: Text("Take a Picture"))
                ],
              )
            ],
          ),
          ElevatedButton(onPressed: save, child: Text("Save Product Data"))
        ],
      )),
    );
  }
}

