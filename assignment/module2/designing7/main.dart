//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/src/material/checkbox.dart';

void main() => runApp( MyApp());

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
  bool ischeck = true;
  var ans = '';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text('appbar'),
    ),
     body: Container(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Checkbox(
                 value: ischeck,
                 onChanged: (val){
                   setState(()
                   {
                     ischeck = val;
                     if(ischeck == true)
                     {
                       ans = 'hello';
                     }else
                     {
                       ans = '';
                     }
                   }
                   );
                   },
                 ),
             SizedBox(
               child:  Text('$ans'),
             ),
           ],
         ),
       ),
     ),
   );
  }
}

