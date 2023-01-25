//@dart=2.9
import 'package:flutter/material.dart';

import 'app_screens/MyNotlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "home",
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.green
     ),
     home: MyNotlist(),
   );

  }

}

