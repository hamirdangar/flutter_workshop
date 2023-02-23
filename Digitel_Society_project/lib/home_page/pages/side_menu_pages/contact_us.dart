import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              Text('Get in touch with us, if you have any query..',style: TextStyle(fontSize: 18),),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.email_outlined,size: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email:',style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('dangarhamir3333@gamil.com'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.ac_unit,size: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Website:',style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                          child: new Text('https://docs.flutter.io/flutter',style: TextStyle(color: Colors.blueAccent),),
                          onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.phone,size: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone:',style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('1800 2740 3323'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('+91 9327975954'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on,size: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address:',style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('1, Street Number 1, Balaji Park,\n Mavdi Village, Mavdi,\n Rajkot, Gujarat 360004'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
