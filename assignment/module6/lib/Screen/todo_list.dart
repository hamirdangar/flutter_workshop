//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}


class _TodoListPageState extends State<TodoListPage> {

  List<dynamic> list;

  bool isLoding = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void navigatToAddpage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoPage()));
  }
  Future<dynamic> fetch()async {
    final response = await http.get(Uri.parse("https://hamirflutter.000webhostapp.com/Api/view.php"),);
    var data =  jsonDecode(response.body) ;
    list = data;
    print(response.body);
    setState(() {
      isLoding = false;
    });
  }

   Future<void> deleteItem(int)async{
     var url = "https://hamirflutter.000webhostapp.com/Api/delete.php";
     http.post(url,body: {
       'id':list[int]
     });
  }

  void delete(int){
    var url = "https://hamirflutter.000webhostapp.com/Api/delete.php";
    http.post(url,body: {
      'id':list[int],
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigatToAddpage,
          label: Text('Add Todo'),
      ),
     body: FutureBuilder(
       future: fetch(),
       builder: (context, snapshot) => RefreshIndicator(
           onRefresh: fetch,
           child: ListView.builder(
                         itemCount: list.length,
                         itemBuilder: (context, index) {
                         return ListTile(
                           leading: CircleAvatar(child: Text('${index+1}')),
                           title: Text(list[index]['uname']),
                           subtitle: Text(list[index]['pass']),
                           trailing: PopupMenuButton(
                            onSelected: (value){
                              if(value == 'edit'){
                              }else if(value == 'delete'){
                                delete(list[index]['id']);
                              }
                            },
                             itemBuilder: (context) {
                               return [
                                 PopupMenuItem(child: Text('Edit'),
                                 value: 'edit',
                                 ),
                                 PopupMenuItem(child: Text('Delete'),
                                 value: 'delete',
                                 ),
                               ];
                             },
                           )
                         );
                 },
             ),
         ),
     ),
     );
  }
}
