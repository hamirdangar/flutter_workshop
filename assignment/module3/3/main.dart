import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
      MaterialApp(
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
      appBar:AppBar(
        title:  Text('appbar'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (ctx) =>AlertDialog(
                  title:  Text("Alert Dialog Box"),
                  content: Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Positive();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(14),
                        child: Text("Positiv"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Negative();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(14),
                        child: Text("Negative"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Neutral();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: EdgeInsets.all(14),
                        child: Text("neutral"),
                      ),
                    ),

                  ],
                ),
              );
            },
            child:  Text('click'),
          ),
        ),
      ),
    );
  }

  Positive() {
    Fluttertoast.showToast(
        msg: "This is a Positive",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  Negative() {
    Fluttertoast.showToast(
        msg: "This is a Negative",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  Neutral() {
    Fluttertoast.showToast(
        msg: "This is a Neutral",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
