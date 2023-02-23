//@dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminMaintenancePage extends StatefulWidget {
  const AdminMaintenancePage({Key key}) : super(key: key);

  @override
  State<AdminMaintenancePage> createState() => _AdminMaintenancePageState();
}

class _AdminMaintenancePageState extends State<AdminMaintenancePage> {

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
        title: Text('Add Meintenance'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => AddMeintenance(),));
         },
      ),
      body: RefreshIndicator(
        onRefresh: fetch,
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

class AddMeintenance extends StatefulWidget {
  const AddMeintenance({Key key}) : super(key: key);

  @override
  State<AddMeintenance> createState() => _AddMeintenanceState();
}

class _AddMeintenanceState extends State<AddMeintenance> {

  TextEditingController _meintenance = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _meintenance,
                decoration: InputDecoration(
                  hintText: 'Meintenance name'
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '\$price'
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      if (_meintenance.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Meintenance",
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
                      if (_price.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Price",
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
                      submit();
                    },
                    child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  submit(){
    var url = Uri.parse('https://hamirflutter.000webhostapp.com/Api/maintenance_insert.php');
    http.post(url,body: {
      'm_name': _meintenance.text,
      'price': _price.text
    });
    Navigator.pop(context);
  }
}

