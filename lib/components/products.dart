import 'package:flutter/material.dart';
import 'package:test1/pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name":"Uniqlo T-SHIRT 5",
      "picture": "images/products/un (1).png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name":"Uniqlo T-SHIRT 6",
      "picture": "images/products/un (6).png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name":"Uniqlo T-SHIRT 1",
      "picture": "images/products/un (2).png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name":"Uniqlo T-SHIRT 2",
      "picture": "images/products/un (3).png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name":"Uniqlo T-SHIRT 3",
      "picture": "images/products/un (4).png",
      "old_price": 18,
      "price": 14,
    },
    {
      "name":"Uniqlo T-SHIRT 4",
      "picture": "images/products/un (5).png",
      "old_price": 18,
      "price": 14,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
          tag: prod_name,
          child: Material(
          child: InkWell(
            onTap: () =>
              Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new ProductDetails(
                  //this will carry product data to another page
                  product_detail_name: prod_name,
                  product_detail_picture: prod_picture,
                  product_detail_old_price: prod_old_price,
                  product_detail_price: prod_price,
                ))),

          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: new Row(children: <Widget>[
                Expanded(
                  child: Text(prod_name, style: TextStyle( fontSize: 10.0),),
                ),

                new Text("\$${prod_price}", style: TextStyle(color: Colors.black, fontSize: 12.0),)
              ],),


            ),
            child: Image.asset(prod_picture,
              fit: BoxFit.cover,
            ),
          ),
          ),
        ),
    ),);
  }
}

