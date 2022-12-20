//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hamir',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  TextEditingController number = TextEditingController();
  var resut = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: number,
                decoration: InputDecoration(
                  labelText: "Enter number",
                ),
                keyboardType: TextInputType.number,
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  setState(()
                  {
                   int r= int.parse(number.text);
                    //Reverse(number.text);
                    int reverse = 0, remainder;

                    while (r != 0)
                    {
                      remainder = r % 10;
                      reverse = reverse * 10 + remainder;
                      r ~/= 10;
                    }
                    resut = reverse;
                    print("aaa $resut");

                   // print("$r");
                  });
                },
                child: Text('reverse'),
              ),
            ),
            SizedBox(
              child: Text('reverse number is $resut'),
            ),
          ],
        ),
      ),
    );
  }

 /* Reverse(revers) {
    //var sb = new StringBuffer();
    for (var i = revers.length - 1; i >= 0; --i) {
      revers.writeCharCode(revers.codeUnitAt(i));
      debugPrint('hamir$revers');
    }
    return revers.toString();

  }*/
}
