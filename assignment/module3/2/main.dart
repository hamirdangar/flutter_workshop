import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'hamir',
    home: MyApp(),
  ));
}

class MyApp  extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('app bar'),
    ),
    body: Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Alert Dialog Box"),
                content: Text("You have raised a Alert Dialog Box"),
                icon: Icon(Icons.diamond),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(14),
                      child: const Text("okay"),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Text('click'),
        ),
      ),
    ),
  );
  }
}
