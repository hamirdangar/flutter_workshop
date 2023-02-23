//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewData.dart';


class MembersPage extends StatefulWidget {
  MembersPage({Key key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPage();
}

class _MembersPage extends State<MembersPage> {
  List<dynamic> list;


  Future<dynamic> fetch() async {
    final response = await http.get(Uri.parse(
        "https://hamirflutter.000webhostapp.com/Api/members_view.php"),);
    var data = await jsonDecode(response.body);
    list = data;
    print('---------------------------${data.toString()}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewData(),));
        },
        icon: Icon(Icons.add),
        label: Text('Add Users'),
      ),
      body: RefreshIndicator(
        onRefresh: fetch,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder(
              future: fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text('${index+1}')),
                          title: Text(list[index]['name']),
                          subtitle: Text(list[index]['email']),
                          trailing: InkWell(
                              onTap: (){
                                confirm(list[index]['id']);
                              },
                              child: Icon(Icons.delete)),
                        ),
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }

  void confirm(int) {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are You Sure?"),
      actions: [
        MaterialButton(
          child: Text("OK DELETE"),
          onPressed: () {
            var url = Uri.parse(
                "https://hamirflutter.000webhostapp.com/Api/members_delete.php");
            http.post(url, body: {
              'id': int,
            });

            Navigator.pop(context);
          },
        ),
        MaterialButton(
          child: Text("CANCEL"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
/*

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx,i){
              return Shimmer.fromColors(
                highlightColor: Colors.black12,
                baseColor: Colors.black26,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black26,
                ),
              );
            }
        )
    );
  }
}*/
