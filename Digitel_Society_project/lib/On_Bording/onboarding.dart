

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:myproject/Login_Page/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context)
{
  final size = MediaQuery.of(context).size;
  final pages = [
    OnBoardingPage1(size: size),
    OnBoardingPage2(size: size),
    OnBoardingPage3(size: size),
  ];
   return Scaffold(
     backgroundColor: Color(0xffffdcbd),
    body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: pages,
          liquidController: controller,
          onPageChangeCallback: onPageChangeCallback,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
        ),
        Positioned(
          bottom: 100,
          child: AnimatedSmoothIndicator(
            activeIndex: controller.currentPage,
            effect: WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0,
            ),
            count: 3,
          ),
        ),
        Positioned(
          top: 700,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
            onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));
            },  //controller.jumpToPage(page: 2),
            child: Text("Start",style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    ),
   );
  }

  void onPageChangeCallback(int activePageIndex) {
   setState(() {
     currentPage = activePageIndex;
   });
  }
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.white,
      child: Center(
        child:  Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Lottie.asset('assets/lottie/lottie1.json'),
              SizedBox(height: 30),
              Text("Secure Your Gate",
                style:Theme.of(context).textTheme.headline4?.apply(color: Colors.black),
              ),
              SizedBox(height: 30),
              Text("Digital Society app users manage their details including family members &"
                  " vehicles for the sake of building a secure and trustful society"
                  " and can be reached anytime & track family members."
                  " GGATE ensures privacy of user data.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
        color: Color(0xfffddcdf),
      child: Center(
        child:  Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Lottie.asset('assets/lottie/lottie2.json'),
              SizedBox(height: 30),
              Text("Manage Profile",
                style:Theme.of(context).textTheme.headline4?.apply(color: Colors.black),
              ),
              SizedBox(height: 30),
              Text("Digital Society Di provides pass-based invites that ensure access is only provided to authorized visitors."
                  " Members of the society can request the pass for their guests / delivery boys through this app.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Color(0xffffdcbd),
      child:  Center(
        child:  Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Lottie.asset('assets/lottie/lottie3.json'),
              SizedBox(height: 30),
              Text("Resources",
                style:Theme.of(context).textTheme.headline4?.apply(color: Colors.black),
              ),
              SizedBox(height: 30),
              Text("Digital Society app users manage their details including family members & vehicles for the sake of building a secure and trustful society"
                  " and can be reached anytime & track family members. GGATE ensures privacy of user data.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}


