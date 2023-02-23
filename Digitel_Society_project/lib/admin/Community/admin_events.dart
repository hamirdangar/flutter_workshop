//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AdminEvents extends StatefulWidget {
  const AdminEvents({Key key}) : super(key: key);

  @override
  State<AdminEvents> createState() => _AdminEventsState();
}

class _AdminEventsState extends State<AdminEvents> {

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
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvents(),));
        },
        icon: Icon(Icons.add),
        label: Text('Event'),
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


class AddEvents extends StatefulWidget {
  const AddEvents({Key key}) : super(key: key);

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {

  TextEditingController _e_title = TextEditingController();
  TextEditingController _e_date = TextEditingController();
  TextEditingController _e_detail = TextEditingController();

  datepicker()async{
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101)
    );
    if(pickedDate != null ){
      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        _e_date.text = formattedDate; //set foratted date to TextField value.
      });
    }else{
      print("Date is not selected");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                TextField(
                  controller: _e_title,
                  decoration: InputDecoration(
                      hintText: 'Title'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _e_date, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                    ),
                    readOnly: true,  // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker
                      datepicker();
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _e_detail,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Event Datels'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      if (_e_title.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter title",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ));
                        return;
                      }
                      if (_e_date.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Select Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ));
                        return;
                      }
                      if (_e_detail.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Detalis",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                        ));
                        return;
                      }
                      Eventsubmit();
                    },
                    child: Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Eventsubmit(){
    var url = Uri.parse('https://hamirflutter.000webhostapp.com/Api/event_insert.php');
    http.post(url,body: {
      'e_title':_e_title.text,
      'e_date':_e_date.text,
      'e_detail':_e_detail.text,
    });
    Navigator.pop(context);
  }
}

