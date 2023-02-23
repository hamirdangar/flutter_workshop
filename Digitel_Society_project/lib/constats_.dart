//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final IconData icon;
  final String height;
  final String width;
  final String title;
  final String subtitle;
  final void Function() onTab;

   MyCard(
      { this.icon,
       this.height,
       this.width,
       this.title,
       this.subtitle,
       this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: Color(0xffFFFBEB),
            boxShadow: [new BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              //blurRadius: 3.0,
            ),],
          ),
        height: 150,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(subtitle),
              ],
            ),
        ),
      ),
    );
  }
}
