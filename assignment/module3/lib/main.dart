
//@dart=2.9
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hamir',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  DateTime _dateTime = DateTime(2100);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text(
              '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime _newDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1800),
                    lastDate: DateTime(3000),
                  );
                  setState(() {
                    if (_newDate != null) {
                      setState(() {
                        _dateTime = _newDate;
                      });
                    }
                  });
                },
                child: Text('get date')
            ),
          ],
        ),
      ),
    );
  }
}
