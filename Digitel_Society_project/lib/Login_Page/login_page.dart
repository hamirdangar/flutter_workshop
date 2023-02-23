//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences logindata;
  bool newuser;
  bool _isObscurePassword = true;
  TextEditingController _name = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  Future loginData() async {
    final result = await http.post(Uri.parse("https://hamirflutter.000webhostapp.com/Api/member_login.php"),
       body: {'name': _name.text, 'pass': _pass.text});
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    var data = json.decode(result.body);

    if (data == 0) {
      print("fail");
    } else {
      String username = _name.text;
      String password = _pass.text;
      if (username != '' && _pass != '') {
        print("success 6");
        logindata.setBool('login', false);
        logindata.setString('username', username);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Myhomepage(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //check_if_already_login();
  }

  //login skip
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      // Navigator.pushReplacement(
      //     context, new MaterialPageRoute(builder: (context) => Myhomepage()));
      Get.off(Myhomepage(),transition: Transition.fade,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffdcbd),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 25),
              Text(
                'Wlecome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _pass,
                obscureText: _isObscurePassword,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "P"
                        "assword",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        _isObscurePassword = !_isObscurePassword;
                      });
                    },
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Forget Password'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      loginData();
                    },
                    child: Text('Login')),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
