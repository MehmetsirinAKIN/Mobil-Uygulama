import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import 'package:sqflite_demo/screens/product_detail.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late DbHelper dbHelper;
  List<Product> products = [];
  int productCount = 0;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper(); // DbHelper instance'ı burada başlatılıyor
    loadProducts();
  }

  void loadProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        this.products = data.cast<Product>();
        this.productCount = data.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){goToProductAdd();},
        child: Icon(Icons.add),
        tooltip: "Yeni ürün Ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.cyan,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Text("P"),
            ),
            title: Text(this.products[position].name),
            subtitle: Text(this.products[position].description),
            onTap: () {
              goToDetail(this.products[position]);
            },
          ),
        );
      },
    );
  }

  void goToProductAdd() async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductAdd()));
    if(result!= null){
      if(result){
        getProducts();
      }
    }
  }

  void getProducts() async{

    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        this.products = data;
        productCount = data.length;
      });

    });

}

  void goToDetail(Product product) async {
    bool result =await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product)));
    if (result != null) {
      if(result){
        getProducts();
    }
    }
  }
}
