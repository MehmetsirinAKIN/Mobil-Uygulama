import 'package:flutter/material.dart';
import 'package:sqflite_demo/screens/product_list.dart'; // ProductList'in olduğu dosyayı import edin.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(), // ProductList burada çağırılıyor
    );
  }
}
