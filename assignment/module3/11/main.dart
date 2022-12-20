import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'hamir',
    home: MayApp(),
  ));
}

class MayApp extends StatefulWidget
{
  @override
  State<MayApp> createState() => _MayAppState();
}

class _MayAppState extends State<MayApp>
{

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePahe(),
    // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter BottomNavigationBar Example'),
          backgroundColor: Colors.green
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.browse_gallery),
                label: 'gallery',
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'oudio',
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back),
              label: 'video',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}

class HomePahe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: Center(
         child: Text('hamir'),
       ),
     ),
   );
  }
}
