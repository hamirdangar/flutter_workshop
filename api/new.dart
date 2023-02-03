//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map mapResponse;
List listRespons;

class CallApi extends StatefulWidget {
  const CallApi({Key key}) : super(key: key);

  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {

  Future getuser() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if(response.statusCode == 200){
      setState(() {
        mapResponse = json.decode(response.body);
        listRespons = mapResponse['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text('text')),
          ),
            Expanded(
              child: FutureBuilder(
               future: getuser(),
               builder: (context, snapshot) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ),
                  itemCount: listRespons == null ? 0 : listRespons.length,
                  itemBuilder: (context, index) =>
                Card(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network(listRespons[index]['avatar'].toString(),fit: BoxFit.cover,width: double.infinity,),
                        height: 150,
                      ),
                      Padding(padding: EdgeInsets.all(0),
                        child: Text('text'),
                      )
                    ],
                  ),
                ),
              ),
              ),
            ),
        ],
      )
    );
  }
}
