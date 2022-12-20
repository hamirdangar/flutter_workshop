//@dart=2.9
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  var ans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appBar'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
              children: [
                TextFormField(
                  controller: number1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      labelText: 'First number',
                      hintText: 'Plese Enter number'
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: number2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      labelText: 'Second number',
                      hintText: 'Plese Enter number'
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int first = int.parse(number1.text);
                      int second = int.parse(number2.text);
                      ans = first + second;
                    });
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SecondPage(ans)));
                  },
                  child: Text('sum'),
                )
              ],
            ),
          ),
        ),
      );
  }
}

class SecondPage extends StatelessWidget
{
  var sum;
  SecondPage(this.sum);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('sum of to number'),
      ),
      body: Container(
        child: Center(
          child:  Text('Sum is $sum'),
        ),
      ),
    );
  }

}
