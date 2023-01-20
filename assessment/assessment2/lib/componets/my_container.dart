//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {

  final String text;
  final String logo;
  final Color color;
  final void Function() onTab;

  MyContainer({this.text, this.logo, this.onTab, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 5,left: 5),
      child: InkWell(
        onTap: onTab,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0
                )
              ]
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo,height: 50,),
              SizedBox(height: 20,),
              Center(
                child: Text(text,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 10
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
