//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MaintenancePage extends StatefulWidget {
  MaintenancePage({Key key}) : super(key: key);

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  List<dynamic> list;

  Future<dynamic> fetch()async {
    final response = await http.get(Uri.parse("https://hamirflutter.000webhostapp.com/Api/maintenance_view.php"),);
    var data = await jsonDecode(response.body) ;
    list = data;
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance List'),
        centerTitle: true,
        backgroundColor: Color(0xffF8CBA6),
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
                    return Card(
                      color: Color(0xffFFFBEB),
                      child: ListTile(
                        title: Text(list[index]['m_name']),
                        trailing: Text('\$${list[index]['price']}'),
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
