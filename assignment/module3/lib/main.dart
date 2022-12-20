//@dart=2.9
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title:  Text('appbar'),
       centerTitle: true,
       actions: [
         Theme(
           data: Theme.of(context).copyWith(
             dividerColor: Colors.white,
             iconTheme: IconThemeData(color: Colors.white),
             textTheme: TextTheme().apply(bodyColor: Colors.green),
           ),
           child: PopupMenuButton<int>(
             color: Colors.indigo,
             onSelected: (item) => onSelected(context, item),
             itemBuilder: (context) =>
             [
               PopupMenuItem<int>(
                 value: 0,
                 child: Row(
                   children: [
                     Icon(Icons.settings),
                     Text('Settings'),
                   ],
                 ),
               ),
               PopupMenuItem<int>(
                 value: 1,
                 child: Row(
                   children: [
                     Icon(Icons.logout),
                     Text('Log Out'),
                     /*UserAccountsDrawerHeader(
                         accountName: Text('Hamir'),
                         accountEmail: Text('dangarhamie33@gmail.com'),
                       currentAccountPicture: CircleAvatar(
                         child: ClipOval(
                           child: Image.network('https://png.pngtree.com/png-clipart/20190115/ourmid/pngtree-chibi-boy-with-glasses-png-image_318105.jpg',
                             width: 90,
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     )*/
                   ],
                 ),
               ),
               PopupMenuDivider(),
               PopupMenuItem<int>(
                 value: 2,
                 child: Row(
                   children: [
                     Icon(Icons.logout),
                     const SizedBox(width: 8),
                     Text('Sign Out'),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ],
     ),
     body: Container(
       color: Colors.green,
     ),
   );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => null),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => null),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => null),
              (route) => false,
        );
    }
  }

}
