import 'package:flutter/material.dart';

import 'Navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      home: SidMenu(),
    );
  }

}

class SidMenu extends StatefulWidget
{
  @override
  State<SidMenu> createState() => _SidMenuState();
}

class _SidMenuState extends State<SidMenu> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    drawer: NavBar(),
    appBar: AppBar(
      title:  Text('Sidmenu'),
    ),
    body: Center(),
  );
  }
}
