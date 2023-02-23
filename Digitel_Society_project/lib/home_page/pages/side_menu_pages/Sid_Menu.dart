//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/home_page/pages/side_menu_pages/contact_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Login_Page/login_page.dart';
import 'about_us.dart';
import 'contact_us.dart';

class SidMenu extends StatefulWidget {
  @override
  State<SidMenu> createState() => _SidMenuState();
}

class _SidMenuState extends State<SidMenu>
{
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  //get
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(()
    {
      username = logindata.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
       return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('welcome to $username'),
              accountEmail: Text('dangarhamir3333@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Icon(Icons.person,size: 40,)
                ),
              ),
              decoration: BoxDecoration(
               color: Color(0xffFFE7CC),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap:(){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text('About Us'),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact Us'),
              onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
              }
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Emergency Contact'),
              onTap:()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()))
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: (){
                logindata.setBool('login', true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
            ),
          ],
        ),
    );
  }
}
