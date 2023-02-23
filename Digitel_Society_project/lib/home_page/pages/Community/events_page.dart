//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventsPage extends StatefulWidget {
  const EventsPage({Key key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  List<dynamic> list = [];

  Future<dynamic> fetch() async{
    final responce = await http.get(Uri.parse('https://hamirflutter.000webhostapp.com/Api/event_view.php'));
    var data = await jsonDecode(responce.body);
    list = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        backgroundColor: Color(0xffF8CBA6),
      ),
      body: RefreshIndicator(
        onRefresh: fetch,
        child: Container(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
            future: fetch(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xffFFFBEB),
                    elevation: 1,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text('Event Title'),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${list[index]['e_title']}',style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Date'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(list[index]['e_date']),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Detals:'),
                              Text(list[index]['e_detail'],style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}