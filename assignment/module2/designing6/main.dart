
//@dart=2.9
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title:  '',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text('appbar'),
     ),
     body:  Container(
       child: Center(
         child: SingleChildScrollView(
           padding: EdgeInsets.all(15),
           child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                    labelText: 'numner',
                    hintText: "plese enter number"
              ),
             keyboardType: TextInputType.number,
           ),
         ),
       ),
     ),
   );
  }

}
