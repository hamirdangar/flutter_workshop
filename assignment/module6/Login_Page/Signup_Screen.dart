//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:lottie/lottie.dart';
import 'package:myproject/Login_Page/login_page.dart';
import 'package:page_transition/page_transition.dart';

import '../home_page/pages/main_page.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignInState();
}

class _SignInState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool _isObscurePassword = true;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ScaffoldMessengerState scaffoldMessenger;

  //Email Validation
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _conformpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffddcdf),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Container(
              child: Lottie.asset('assets/lottie/signup_lottie.json',height: 200),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black
                ),
              ),
                 ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _passwordController,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                  hintText: "Password",
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
              height: 30,
            ),
            TextField(
              controller: _conformpasswordController,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                  hintText: "Conform Password",
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
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffffdcbd),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (isLoading) {
                        return;
                      }
                      if (_nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Name",
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
                      if (!reg.hasMatch(_emailController.text)) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Enter Valid Email",
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
                      if (_passwordController.text.isEmpty ||
                          _passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Password should be min 6 characters",
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
                      String pass = _passwordController.text.toString();
                      String cpass = _conformpasswordController.text.toString();

                      if (pass.compareTo(cpass) != 0 || cpass.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                             content: Text(
                            'Please confirm password',
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
                      signup(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text);
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 120),
                  child: (isLoading)
                      ? Center(
                          child: Container(
                              height: 26,
                              width: 26,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                              )))
                      : Center(
                        child: Container(
                            child: Text('SignUp'),
                          ),
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LoginPage()));
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: LoginPage(),
                        inheritTheme: true,
                       // duration: Duration(milliseconds: 300),
                        ctx: context),
                  );
                },
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: 'Alread have an account? '),
                  TextSpan(
                      text: ' Login',
                      style: TextStyle(color: Colors.red))
                ]))),
          ],
        ),
      ),
    );
  }

  signup(name, email, password) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");

    Map data = {'uname': name, 'email': email, 'pass': password};
    print(data.toString());

    final response = await http.post(
        Uri.parse("https://hamirflutter.000webhostapp.com/Api/insert.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

       // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
       Get.off(LoginPage(),transition: Transition.fade,);

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> user = resposne['data'];
        print(" User name ${user['data']}");
        //savePref(1,user['name'],user['email'],user['id']);

      } else {
        print(" ${resposne['message']}");
      }
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text("${resposne['Fmessage']}")));
    } else {
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text("Please Try again")));
    }
  }
}
