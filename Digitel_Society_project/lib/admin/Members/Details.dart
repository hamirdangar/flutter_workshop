//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Edit.dart';
import '../home_page.dart';

class Detail extends StatefulWidget
{

  List list;
  int index;


  Detail({this.list, this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail>
{

  void delete(){
    var url = Uri.parse("https://hamirflutter.000webhostapp.com/Api/delete.php");
    http.post(url,body: {
      'id':widget.list[widget.index]['id'],
    });
  }

  void confirm(){

    AlertDialog alertDialog = AlertDialog(
      content: Text("Are You Sure?"),
      actions: [
        MaterialButton(
          child: Text("OK DELETE"),
          onPressed: (){
            delete();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeAdmin()));
          },
        ),
        MaterialButton(
          child: Text("CANCEL"),
          onPressed: (){},
        ),

      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('${widget.list[widget.index]['uname']}'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.list[widget.index]['uname'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                widget.list[widget.index]['uname'],

              ),
              MaterialButton(
                child: Text("Edit"),
                color: Colors.deepPurpleAccent,

                onPressed: ()=>Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)),
                ),
              ),
              MaterialButton(
                  child: Text("Delete"),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    confirm();
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
