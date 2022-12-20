import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'hamir',
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
  var ans;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text('appBar'),
     ),
     body: Container(
       color: ans,
       padding: EdgeInsets.all(15),
       child: Center(
         child: Column(
           children: [
             ListTile(
               title: const Text('pink'),
               leading: Radio(
                 value: 2,
                 groupValue: ans,
                 activeColor: Colors.black,
                 onChanged: (value)
                 {
                   setState(()
                   {
                      ans = Colors.red;
                   });
                 },
               ),
             ),
             ListTile(
               title: const Text('green'),
               leading: Radio(
                 value: 3,
                 groupValue: ans,
                 activeColor: Colors.black,
                 onChanged: (value) {
                   setState(() {
                      ans = Colors.cyan;
                   });
                 },
               ),
             ),
             ListTile(
               title: const Text('blue'),
               leading: Radio(
                 value: 4,
                 groupValue: ans,
                 activeColor: Colors.black,
                 onChanged: (value) {
                   setState(() {
                      ans = Colors.green;
                   });
                 },
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }
}
