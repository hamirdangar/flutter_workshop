//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget
{
  var nameFromHome1;
  var nameFromHome2;
  var nameFromHome3;
  SecondScreen(this.nameFromHome1,this.nameFromHome2,this.nameFromHome3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "SecondScreen"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text('name $nameFromHome1'
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: Text('email $nameFromHome2'
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: Text('number $nameFromHome3'
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ),
        ],
      ),
    );
  }

}
// Navigator.push(context, MaterialPageRoute(builder: (context) =>
// SecondScreen(nameControllar1,
// nameControllar2,
// nameControllar3.text.toString()),
// )
// );