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
  var textsize =20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'appBar'
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  textsize=textsize+1;
                });           },
                  child: Text("+"),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  textsize=textsize-1;
                });
              },
                  child: Text('-')),
              SizedBox(
                child: Text('h',style: TextStyle(fontSize: textsize),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


