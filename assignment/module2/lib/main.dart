import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'hamir',
     home: Homepage(),
   );
  }

}

class Homepage extends StatefulWidget
{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text('appbar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                animation: true,
                animationDuration: 2000,
                radius: 150,
                lineWidth: 40,
                percent: 0.5,
                progressColor: Colors.cyan,
                backgroundColor: Colors.red.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('50%',style: TextStyle(fontSize: 50),),
              ),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 2000,
                lineHeight: 40,
                percent: 0.5,
                progressColor: Colors.cyan,
                backgroundColor: Colors.red.shade100,
                barRadius: const Radius.circular(16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
