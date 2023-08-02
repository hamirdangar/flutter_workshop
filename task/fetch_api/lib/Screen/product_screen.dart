import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Screen/detail_screen.dart';

import 'model.dart';


class ProductScreen extends StatefulWidget {
  String category;
  ProductScreen({Key? key,required this.category}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  late Future<ProductList> _productListFuture;

  Future<ProductList> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/category/${widget.category}'),
    );
    if (response.statusCode == 200) {
      return ProductList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    _productListFuture = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: FutureBuilder<ProductList>(
        future: _productListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: snapshot.data!.products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data!.products[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(id: product.id)));
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(product.thumbnail,fit: BoxFit.cover,)
                          ),
                          SizedBox(height: 5),
                          Text('\$${product.price}'),
                          Text(product.title),
                        ],
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          // By default, show a loading spinner
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
