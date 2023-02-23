//@dart=2.9
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../On_Bording/onboarding.dart';
import '../admin/home_page.dart';
import '../home_page/pages/main_page.dart';

class SplashScreen extends StatefulWidget
{  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{

  SharedPreferences logindata;
  SharedPreferences adminlogindata;
  SharedPreferences uniquedata;

  bool newuser;
  bool newadmin;
  bool newunique;
  //login skip
  /*void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      // Navigator.pushReplacement(
      //     context, new MaterialPageRoute(builder: (context) => Myhomepage()));
      Get.off(Myhomepage(),transition: Transition.leftToRight);
    }else{
      Timer(Duration(seconds: 3),() {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Onboarding()));
        Get.off(Onboarding(),transition: Transition.leftToRight);
      },
      );
    }
  }*/


  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    adminlogindata = await SharedPreferences.getInstance();
    newadmin = (adminlogindata.getBool('admin_login') ?? true);

    uniquedata = await SharedPreferences.getInstance();
    newunique = (uniquedata.getBool('unique_login') ?? true);

    if (newuser != false && newadmin != false && newunique != false) {
      logindata.setBool('login', false);
      adminlogindata.setBool('admin_login', false);
      uniquedata.setBool('unique_login', false);
      Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Onboarding())),
      );
    }
    else{
      if(newuser == false && newadmin == true){
        if(newunique == true){
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding()));
        }
        else{
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', true);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Myhomepage()));
        }
      }
      else if(newuser == true && newadmin == false){
        if(newunique == true){
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding()));
        }
        else{
          logindata.setBool('login', true);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeAdmin()));
        }
      }
      else{
        logindata.setBool('login', false);
        adminlogindata.setBool('admin_login', false);
        uniquedata.setBool('unique_login', false);
        Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Onboarding())),
        );
      }
    }
  }



  @override
  void initState() {
    super.initState();
    check_if_already_login();

  }

  @override
  Widget build(BuildContext context) {
   return Container(
     color: Colors.white,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children:[
         Lottie.asset('assets/lottie/lottie.json',
             height: 400.0,
             repeat: true,
             reverse: true,
             animate: true
         ),
       ],
     ),
   );
  }}
