import 'dart:convert';

import 'package:assessment1/sign_in_up_pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/TextFild.dart';
import '../Screen/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  Future loginData() async {
    final result = await http.post(
        Uri.parse("https://hamirflutter.000webhostapp.com/Api/gmaillogin.php"),
        body: {'email': emailController.text, 'pass': passwordController.text});

    var data = json.decode(result.body);

    if (data == 0) {
      print("fail");
    } else {
      String username = emailController.text;
      String password = passwordController.text;
      if (username != '' && passwordController != '') {
        print("success 6");
        logindata.setBool('login', false);
        logindata.setString('username', username);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  //login skip
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFfA555EC),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset('lib/images/e_logo.png', height: 150),
                ),
                SizedBox(height: 10),
                Text('ECORP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.black)),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    height: 400,
                    width: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          MyTextFild(
                            labelText: 'email',
                            obscureText: false,
                            controller: emailController,
                            prefixIcon: Icon(Icons.person),
                          ),
                          SizedBox(height: 25),
                          MyTextFild(
                            labelText: 'password',
                            obscureText: true,
                            controller: passwordController,
                            prefixIcon: Icon(Icons.lock),
                          ),
                          SizedBox(height: 25),
                          Text('Forgot Password?'),
                          SizedBox(height: 25),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                20,
                              )),
                            ),
                            onPressed: () {
                              if (emailController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please Enter Email',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              }
                              if (passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please Enter a PASSWORD',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              }
                              loginData();
                            },
                            child: Text('  Login  '),
                          ),
                          SizedBox(height: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: Text('SignUP'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
