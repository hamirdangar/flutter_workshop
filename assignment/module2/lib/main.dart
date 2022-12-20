import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'hd',
     home: HomePage(),
   );
  }
}

class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  bool change_color = true;
  void updateUI() {
    setState(() {
      change_color = !change_color;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text('appbar'),
       backgroundColor: Colors.green,
     ),
     body: Container(
       color:  change_color == true ? Colors.blue : Colors.pink,
       child: Center(
         child: ElevatedButton(
           child: Text('click'),
           onPressed: () => updateUI(),
         ),
       ),
     ),
   );
  }
}
