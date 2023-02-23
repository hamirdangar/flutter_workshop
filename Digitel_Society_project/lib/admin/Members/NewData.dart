//@dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../home_page.dart';


class NewData extends StatefulWidget {
  const NewData({Key key}) : super(key: key);

  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {

  bool isLoading = false;
  bool _isObscurePassword = true;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ScaffoldMessengerState scaffoldMessenger;

  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _membersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xfffddcdf),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Container(
              height: 150,
              child: Center(child: Text('Register Members',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
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
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                /*suffixIcon: IconButton(
                  icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                ),*/
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
              controller: _numberController,
             keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                /*suffixIcon: IconButton(
                  icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                ),*/
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _membersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Members",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(
                    Icons.people_alt,
                    color: Colors.black
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
                    child: Text('Add Members'),
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
                      if (_numberController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Number",
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
                      if (_membersController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Members",
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
                     /* String pass = _passwordController.text.toString();
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
                      }*/
                      addData();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
  void addData(){
    var url = Uri.parse("https://hamirflutter.000webhostapp.com/Api/members_insert.php");
    http.post(url,body: {
      "name": _nameController.text.toString(),
      "email": _emailController.text.toString(),
      "pass": _passwordController.text.toString(),
      "number": _numberController.text.toString(),
      "members": _membersController.text.toString(),
    });
    Navigator.pop(context);
  }
}