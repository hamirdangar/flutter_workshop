
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _name = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  late SharedPreferences lodigdata;
  late bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  //login skip
  void check_if_already_login() async
  {
    lodigdata = await SharedPreferences.getInstance();
    newuser = (lodigdata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
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
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "P"
                      "assword",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      if(_name.text.isEmpty){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            'Please Enter First Name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ));
                        return;
                      }
                      if(_pass.text.isEmpty){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            'Please Enter First Name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ));
                        return;
                      }
                      String username = _name.text.toString();
                      String password = _pass.text.toString();

                      if (username != '' && password != '')
                      {
                        print('Successfull');
                        lodigdata.setBool('login', false);
                        lodigdata.setString('username', username);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }
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
