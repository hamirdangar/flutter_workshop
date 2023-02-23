//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/home_page/pages/Community/community_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Community/AdminCommunity.dart';
import 'Members/members_page.dart';
import 'Members/NewData.dart';

class HomeAdmin extends StatefulWidget {
  HomeAdmin({Key key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdmin();
}

class _HomeAdmin extends State<HomeAdmin> {

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
    logindata.setBool('login', true);
    adminlogindata.setBool('admin_login', false);
    uniquedata.setBool('unique_login', false);
  }

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Residents'),
        centerTitle: true,
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
          BottomNavigationBarItem(icon: Icon(Icons.apartment_sharp),label: 'Community'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
      body: IndexedStack(
        children: [
          MembersPage(),
          AdminCommuniti()
        ],
        index: _selectedIndex,
      ),
    );
  }
}
/*

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx,i){
              return Shimmer.fromColors(
                highlightColor: Colors.black12,
                baseColor: Colors.black26,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black26,
                ),
              );
            }
        )
    );
  }
}*/
