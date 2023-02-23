//@dart=2.9
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddTodoPage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(hintText: 'title'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              hintText: 'description',
            ),
            //keyboardType: TextInputType.multiline,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                addData();
                Navigator.pop(context);
              },
              child: Text('Submit'),
          )
        ],
      ),
    );
  }
  // Future<void> submit()async {
  //   final title = titlecontroller.text;
  //   final description = descriptioncontroller.text;
  //   final response = await http.post(Uri.parse('https://hamirflutter.000webhostapp.com/Api/insert.php'),
  //    body:jsonEncode({
  //      "uname":title,
  //      "pass":description
  //    },),
  //     // headers: {'Content-Type': 'application/json'},
  //   );
  //   if(response.statusCode == 200){
  //     titlecontroller.text = '';
  //     descriptioncontroller.text = '';
  //     showSuccesssMessge('Success',Colors.white);
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => TodoListPage()));
  //   }else{
  //     showSuccesssMessge('Error',Colors.red);
  //   }
  // }

  void addData(){
    var url = "https://hamirflutter.000webhostapp.com/Api/insert.php";
    http.post(url,body: {
      "uname": titlecontroller.text,
      "pass": descriptioncontroller.text
    });

  }

  void showSuccesssMessge(String massege,colors){
    final snackBar = SnackBar(content: Text(massege),backgroundColor: colors,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
