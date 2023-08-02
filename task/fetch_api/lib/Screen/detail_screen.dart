import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  var id;

  DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map<String, dynamic> productData = {};
  bool isLoading = true;

  Future<void> fetchProductData() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/${widget.id}'));
    if (response.statusCode == 200) {
      setState(() {
        productData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProductData();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          productData['title'] ?? 'Loading...',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CarouselSlider(
                      items: List<Widget>.from(productData['images'].map((image) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(image, fit: BoxFit.cover),
                          ),
                        );
                      })),
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: productData['images'].length,
                      position: currentIndex.toDouble(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Price: \$${(productData['price'] - (productData['price'] * productData['discountPercentage'] / 100)).toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Category: ${productData['category']}',
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
