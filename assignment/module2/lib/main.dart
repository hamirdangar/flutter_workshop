//@dart=2.9
import 'package:designing_2/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ggd',
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  List<int> numbersList = [];
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('appbar'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: num1controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
                labelText: 'First Number',
                hintText: 'Enter First Number',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: num2controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Secon Number',
                hintText: 'Enter Secon Number',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: ElevatedButton(
                child: Text('click'),
                onPressed: (){
                  setState(() {
                    int i;
                    int first =int.parse(num1controller.text);
                    int second =int.parse(num2controller.text);

                    for(i=first;i<=second;i++)
                    {
                        debugPrint('result $i');
                        numbersList.add(i);
                    }
                    return  Navigator.
                    push(context, MaterialPageRoute(builder: (context)=>SecondScreen(numbersList)));
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
