import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    )
      );
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5,horizontal: 100)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 32)),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Text('click'),
          ),
        ),
      ),
    );
  }
  
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('welcome'),
     ),
   );
  }
}
