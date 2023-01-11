
import 'dart:convert';

import 'package:assessment1/Components/TextFild.dart';
import 'package:assessment1/Screen/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpassController = TextEditingController();

  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late ScaffoldMessengerState scaffoldMessenger;

  bool isLoading = false;
  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFfA555EC),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 30,),

                Text('SignUp', style: TextStyle(color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),

                SizedBox(height: 20),

                Text('Create a new account',
                  style: TextStyle(color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  height: 600,
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),

                        MyTextFild(
                          controller: firstnameController,
                          labelText: 'First name',
                          obscureText: false,
                        ),

                        SizedBox(height: 25),

                        MyTextFild(
                          controller: lastnameController,
                          labelText: 'last name',
                          obscureText: false,
                        ),

                        SizedBox(height: 25),

                        MyTextFild(
                            controller: emailController,
                            labelText: 'Email',
                            obscureText: false,
                            prefixIcon: Icon(Icons.email)
                        ),

                        SizedBox(height: 25),

                        MyTextFild(
                            controller: passwordController,
                            labelText: 'password',
                            obscureText: true,
                            prefixIcon: Icon(Icons.lock)
                        ),

                        SizedBox(height: 25),

                        MyTextFild(
                            controller: confirmpassController,
                            labelText: 'Confirm Password',
                            obscureText: true,
                            prefixIcon: Icon(Icons.lock)
                        ),

                        SizedBox(height: 40),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20))),
                          onPressed: () {

                            if (firstnameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please Enter First Name',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  )
                              );
                              return;
                            }

                            if (lastnameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please Enter Last Name',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  )
                              );
                              return;
                            }

                            if (!reg.hasMatch(emailController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Please enter valid email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  )
                              );
                              return;
                            }
                            if (passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter password',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  )
                              );
                              return;
                            }
                            String pass = passwordController.text.toString();
                            String cpass = confirmpassController.text.toString();

                            if (pass.compareTo(cpass)!=0)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please confirm password',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                  )
                              );
                              return;
                            }
                            signup(
                                firstnameController.text,
                                emailController.text,
                                passwordController.text
                            );
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text('SignUp'),
                        ),

                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.grey[700]
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: Text('Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  signup(name,email,password) async
  {
    setState(() {
      isLoading=true;
    });
    print("Calling");

    Map data = {
      'uname': name,
      'email': email,
      'pass': password
    };
    print(data.toString());

    final  response= await http.post(
        Uri.parse("https://hamirflutter.000webhostapp.com/Api/insert.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },


        body: data,
        encoding: Encoding.getByName("utf-8")
    )  ;

    if (response.statusCode == 200) {

      setState(() {
        isLoading=false;

      });
      Map<String,dynamic>resposne=jsonDecode(response.body);
      if(!resposne['error'])
      {
        Map<String,dynamic>user=resposne['data'];
        print(" User name ${user['data']}");
        //savePref(1,user['name'],user['email'],user['id']);

      }
      else{
        print(" ${resposne['message']}");
      }
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));

    }
    else
    {
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Try again")));
    }



  }
}
