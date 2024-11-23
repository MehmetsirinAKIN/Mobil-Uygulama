import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';

import '../models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ProductAddState ();
  }
}

class ProductAddState extends State{
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün ekle"),
      ),
      body: Padding(
          padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),buildDescriptionField(),buildUnitPriceField(),buildSaveButton()
          ]
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı" ),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
    decoration: InputDecoration(labelText: "Ürün Açıklaması" ),
    controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
    decoration: InputDecoration(labelText: "Ürün Birim Fiyatı" ),
    controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return ElevatedButton(
      child: Text("Ekle"),
      onPressed: () {
        addProduct();
      },
    );
  }


  void addProduct() async{
    var result = await dbHelper.insert(Product(txtName.text, txtDescription.text, double.tryParse(txtUnitPrice.text) ?? 0,));
    Navigator.pop(context,true);

  }
}


