
//@dart=2.9
import 'package:assessment1/Screen/question/question_screen.dart';
import 'package:assessment1/Screen/quiz/constant.dart';
import 'package:assessment1/Screen/quiz/screens/quiz/quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sign_in_up_pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF00FFCB),
        title: Text('Quiz App'),
        centerTitle: true,
        actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.green),
              ),
              child: PopupMenuButton<int>(
                color: Colors.indigo,
                //onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) =>
                [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text('Profile'),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.share_rounded),
                        Text('Share'),
                      ],
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    onTap: (){

                      logindata.setBool('login', true);
                      Get.to(LoginPage());
                     // Navigator.pushReplacement(context,
                        //  MaterialPageRoute(builder: (context) => LoginPage()));

                        print('object');
                      //logindata.setBool('login', true);

                      //Navigator.pushReplacement(context,
                         //  MaterialPageRoute(builder: (context) => LoginPage()));
                        //print('object');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        const SizedBox(width: 8),
                        Text('Sign Out'),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.to(QuestionScreen()),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Read Question",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: () => Get.to(QuizScreen()),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Lets Start Quiz",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
