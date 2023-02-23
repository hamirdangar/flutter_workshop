//@dart=2.9

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List sliderimage = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4raHrQEWpSgtRcVBzxKKm0dwT22NVzCu5NA&usqp=CAU',
    'https://media.istockphoto.com/id/901674706/photo/new-apartment-building-modern-residential-development-with-outdoor-facilities-in-a-green-urban.jpg?b=1&s=170667a&w=0&k=20&c=xv1-vYPDfOY4Z6PW6QzY9PesddV4H-RCb6O8dQgwx1w=',
    'https://media.istockphoto.com/id/957087356/photo/facade-of-a-modern-apartment-building-in-the-city.jpg?b=1&s=170667a&w=0&k=20&c=r5h8UrbBQtke_hdCq0t1gyq0BtNoqcbl-44zxZN2lZk=',
    'https://5.imimg.com/data5/NY/FE/YV/SELLER-9873012/children-multi-playways-500x500.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(children: <Widget>[
        Container(
          height: 200,
          color: Color(0xffFFE7CC),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome to our society.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/home_page.png',
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The ultimate goal of society is to promote',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.grey[700]),
                  ),
                  Text(
                    'good and happy life for its individuals',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text('Socity ',
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              CarouselSlider(
                items: sliderimage
                    .map((item) => Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                item,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 180.0,
                  // enlargeCenterPage: true,
                  autoPlay: true,
                  // aspectRatio: 16 / 9,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  //enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  // viewportFraction: 0.8,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text('Community',
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 150,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/community1.png')),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFBEB),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('social media'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 150,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/community5.png'),),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFBEB),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('helping'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 150,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/community3.png')),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFBEB),
                        ),
                        child: Padding(

                          padding: const EdgeInsets.all(8.0),
                          child: Text('business'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 150,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/community6.png'),),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFBEB),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('teamwork'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
