//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../home_page/pages/home.dart';




class Edit extends StatefulWidget {

  final List list;
  final int index;


  Edit({this.list, this.index});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController cname;
  TextEditingController cmobile;


  void editData(){
    var url = Uri.parse("https://hamirflutter.000webhostapp.com/Api/update.php");
    http.post(url,body: {

      'id':widget.list[widget.index]['id'],
      'uname': cname.text,
      'pass':cmobile.text,
    });
  }

  @override
  void initState() {

    cname = TextEditingController(text: widget.list[widget.index]['uname']);
    cmobile = TextEditingController(text: widget.list[widget.index]['pass']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(

        title: Text("Edit Data ${widget.list[widget.index]['uname']}"),
      ),

      body: ListView(
        children: [
          TextField(
            controller: cname,
            decoration: InputDecoration(hintText: "Enter Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "Enter password",labelText: "Enter email"),

          ),

          MaterialButton(
            child: Text("Edit Data"),
            onPressed: (){
              editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> Home()),
              );
            },
          )
        ],
      ),
    );
  }
}