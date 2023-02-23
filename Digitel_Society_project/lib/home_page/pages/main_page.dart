//@dart=2.9
import 'package:flutter/material.dart';
import 'package:myproject/home_page/pages/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'side_menu_pages/Sid_Menu.dart';
import 'Community/community_page.dart';
import 'home.dart';


class Myhomepage extends StatefulWidget
{
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage>
{
  SharedPreferences logindata;
  SharedPreferences adminlogindata;
  SharedPreferences uniquedata;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    adminlogindata = await SharedPreferences.getInstance();
    uniquedata = await SharedPreferences.getInstance();
    logindata.setBool('login', false);
    adminlogindata.setBool('admin_login', true);
    uniquedata.setBool('unique_login', false);
    logindata = await SharedPreferences.getInstance();
      setState(()
      {
        username = logindata.getString('username');
      });
  }

  String username;
  int _selectedIndex = 0;


  //get
  // void initial() async {
  //   initial();
  //   logindata = await SharedPreferences.getInstance();
  //   setState(()
  //   {
  //     username = logindata.getString('username');
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hi, $username",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          /*actions: [
            MenuPage(),
          ],*/
        ),
        drawer: SidMenu(),
        body: IndexedStack(
                children: [
                  Home(),
                  CommunitiPage(),
                  ProfilePage()
                ],
                index: _selectedIndex,
              ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment),label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Person'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}