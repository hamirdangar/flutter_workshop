import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'hamir',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Container(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('hamir'),
            accountEmail: Text('dangarhamir3333@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://png.pngtree.com/png-clipart/20190115/ourmid/pngtree-chibi-boy-with-glasses-png-image_318105.jpg',
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://images.all-free-download.com/images/graphiclarge/blue_textile_background_8_211913.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('call'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text('sevirces'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
