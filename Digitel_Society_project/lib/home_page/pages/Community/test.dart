//@dart=2.9
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class MyApp123 extends StatelessWidget {


  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
{

  List<dynamic> list;

  Future<dynamic> fetch()async {
    final response = await http.get(Uri.parse("https://hamirflutter.000webhostapp.com/Api/members_view.php"),);
    var data = await jsonDecode(response.body) ;
    list = data;
    print(response.body);
  }


  final Future<dynamic> _calculation = Future<dynamic>.delayed(
    const Duration(seconds: 2),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
   /* return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>
        (
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );*/

    return Scaffold(
      appBar: AppBar(
        title: Text('Residents'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: _calculation,
            //future: fetch(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
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
                        child: ListTile(
                          leading:CircleAvatar(child: Text('${index+1}')),
                          trailing: Text(list[index]['members']),
                          subtitle: Text(list[index]['email']),
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
