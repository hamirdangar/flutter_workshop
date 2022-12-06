

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget
{
  /*var number1;
  var number2;*/
  List<int> numbersList = [];
  SecondScreen(this.numbersList);

  /*void number(){
    setState(() {
      int i;
      int first =int.parse(widget.number1.text);
      int second =int.parse(widget.number1.text);

      for(i=first;i<=second;i++)
      {
        debugPrint('result $i');
        numbersList.add(i);
      }
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hamir')
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            child: Text('result$numbersList'),
          ),
        ),
      ),
    );
  }
}
