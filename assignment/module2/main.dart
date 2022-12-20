
//@dart=2.9


/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(RadioButton());
}
class RadioButton extends StatefulWidget
{
  @override
  _RadioState createState() => _RadioState();

}

class _RadioState extends State<RadioButton>
{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(

      title: "My RadioButton",
      home: Scaffold(
        appBar: AppBar(

        ),
        body: Center
          (
          child: MyStatefulWidget(),
        ),

      ),

    );

  }

}
enum BestTutorSite { javatpoint,w3schools,tutorialandexample}

class MyStatefulWidget extends StatefulWidget
{
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
{
  BestTutorSite _site = BestTutorSite.javatpoint;

  @override
  Widget build(BuildContext context)
  {
    return Column(

        children: <Widget>[

          ListTile(
            title: const Text('www.javatpoint.com'),
            leading: Radio(
              value: BestTutorSite.javatpoint,
              groupValue: _site,
              onChanged: (BestTutorSite value) {
                setState(() {
                  _site = value;
                });
              },
            ),
          ),

          ListTile(
            title: const Text('www.w3school.com'),
            leading: Radio(
              value: BestTutorSite.w3schools,
              groupValue: _site,
              onChanged: (BestTutorSite value) {
                setState(() {
                  _site = value;
                });
              },
            ),
          ),

          ListTile(
            title: const Text('www.tutorialandexample.com'),
            leading: Radio(
              value: BestTutorSite.tutorialandexample,
              groupValue: _site,
              onChanged: (BestTutorSite value) {
                setState(() {
                  _site = value;

                });
              },
            ),
          ),

        ]

    );
  }

}*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  @override
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
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  var ans;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("appbar"),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
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
              ListTile(
                title: const Text('+'),
                leading: Radio(
                  value: 1,
                  groupValue: ans,
                  onChanged: ( value) {
                    setState(() {
                      int first =int.parse(num1controller.text);
                      int second =int.parse(num2controller.text);
                      ans = first+second;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('-'),
                leading: Radio(
                  value: 2,
                  groupValue: ans,
                  onChanged: (value) {
                    setState(() {
                      int first =int.parse(num1controller.text);
                      int second =int.parse(num2controller.text);
                      ans = first-second;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('*'),
                leading: Radio(
                  value: 3,
                  groupValue: ans,
                  onChanged: (value) {
                    setState(() {
                      int first =int.parse(num1controller.text);
                      int second =int.parse(num2controller.text);
                      ans = first*second;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('/'),
                leading: Radio(
                  value: 4,
                  groupValue: ans,
                  onChanged: (value) {
                    setState(() {
                      int first =int.parse(num1controller.text);
                      int second =int.parse(num2controller.text);
                      ans = first/second;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Result :$ans'),
            ],
          ),
        ),
      )  ,
    );
  }
}
