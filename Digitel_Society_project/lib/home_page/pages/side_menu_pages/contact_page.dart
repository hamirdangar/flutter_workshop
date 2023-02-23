//@dart=2.9

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
        backgroundColor: Color(0xffF8CBA6),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ListTile(
              onTap: (){
                var url = Uri.parse("tel:100");
                launchUrl(url);
              },
              leading: CircleAvatar(
                //minRadius: 30,
                maxRadius: 30,
                backgroundColor:Color(0xffFFFBEB),
                child: ClipOval(
                  child: Icon(Icons.local_police_outlined,),
                ),
              ),
              title: Text('POLICE',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              subtitle: Text('100',style: TextStyle(color: Colors.deepOrange),),
              trailing: Icon(Icons.call),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: (){
                var url = Uri.parse("tel:101");
                launchUrl(url);
              },
              leading: CircleAvatar(
                //minRadius: 30,
                maxRadius: 30,
                backgroundColor:Color(0xffFFFBEB),
                child: ClipOval(
                  child: Icon(Icons.local_police_outlined,),
                ),
              ),
              title: Text('FIRE STATION',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              subtitle: Text('101',style: TextStyle(color: Colors.deepOrange),),
              trailing: Icon(Icons.call),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: (){
                var url = Uri.parse("tel:108");
                launchUrl(url);
              },
              leading: CircleAvatar(
                //minRadius: 30,
                maxRadius: 30,
                backgroundColor:Color(0xffFFFBEB),
                child: ClipOval(
                  child: Icon(Icons.local_police_outlined,),
                ),
              ),
              title: Text('AMBULANCE',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              subtitle: Text('108',style: TextStyle(color: Colors.deepOrange),),
              trailing: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
