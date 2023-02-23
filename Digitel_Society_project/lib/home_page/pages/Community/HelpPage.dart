//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<dynamic> list;

  Future<dynamic> fetch()async {
    final response = await http.get(Uri.parse("https://hamirflutter.000webhostapp.com/Api/members_view.php"),);
    var data = await jsonDecode(response.body) ;
    list = data;
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helping Members'),
        backgroundColor: Color(0xffF8CBA6),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: fetch(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        var url = Uri.parse("tel:${list[index]['number']}");
                        launchUrl(url);
                      },
                      child: Card(
                        color: Color(0xffFFFBEB),
                        child: ListTile(
                          leading:CircleAvatar(
                              backgroundColor: Color(0xffF6F7C1),
                              child: Text('${index+1}')),
                          trailing: Icon(Icons.call),
                          subtitle: Text(list[index]['number']),
                          title: Text(list[index]['name']),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
