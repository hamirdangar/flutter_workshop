
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'hamir',
    home: MyApp(),
     )
  );
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:  AppBar(
      title:  Text('appbar'),
    ),
    body: Container(
      child: Center(
        child:  ElevatedButton(
          child: Text('Exit app'),
          onPressed: (){
            showAlertDialog1(context);
          },
        ),
      ),
    ),
  );
  }

  void showAlertDialog1(context) {
    Widget okButton = TextButton
      (
      child: Text("YES"),
      onPressed: ()
      {
        SystemNavigator.pop();

      },
    );
    Widget okButton2 = TextButton
      (
      child: Text("NO"),
      onPressed: ()
      {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog
      (
      title: Text("Exit App"),
      content: Text("Are you sure to exit"),
      actions:
      [
        okButton,
        okButton2
      ],
    );
    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return alert;

      },

    );
  }

}
