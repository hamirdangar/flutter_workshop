//@dart=2.9


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task2/SecondScreen.dart';
import 'package:task2/task.dart';
import 'package:path/path.dart';

import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'homepahe',
      theme: ThemeData(
      ),
      home: FirstScreen(),

    );

  }
}

class FirstScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var nameControllar1 = TextEditingController();
  var nameControllar2 = TextEditingController();
  var nameControllar3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String data;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'login page'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      controller: nameControllar1,
                      decoration: InputDecoration(
                          label: Text("name"),
                          hintText: 'user name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a Name!';
                          }
                          return null;
                        }
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                        controller: nameControllar2,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          hintText: 'Enter Your Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onFieldSubmitted: (value) {

                        },
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        }
                    ),
                  ),
              SizedBox(
                height: 100,
                  child: TextFormField(
                      controller: nameControllar3,
                      decoration: InputDecoration(
                          label: Text("Phone number"),
                          hintText: 'Enter your number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      ),
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (value) {

                      },
                      validator: (value) {

                        //print("aaa $value");
                        if (value.length != 10){
                          return 'Mobile Number must be of 10 digit';
                        }
                        return null;
                      }
                  )
              ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'password',
                      hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                    ),
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(
                              r"^[1-4]").hasMatch(value)
                      ) {
                        return 'Enter a valide password';
                      }
                      return null;
                    },
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                          'submit'
                      ),
                      onPressed: () {
                        _submit(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  _submit(context)
  {
    final number = formkey.currentState.validate();
    if (!number) {
      return ShowTost();
    } 
    else {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
          SecondScreen(nameControllar1.text,
                      nameControllar2.text,
                      nameControllar3.text.toString()),
        ));
      
    }
      
    }
  }

  ShowTost() {
    Fluttertoast.showToast(
      msg: "please enter valide email,Number and password",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.red,

    );
  }

