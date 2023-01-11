//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  final List<Map<String, dynamic>> _allUsers = [
  {
      "id": 1,
      "question": "1.Who developed the Flutter Framework and continues to maintain it today?",
        "option1": "A-Facebook",
        "option2": "B-Microsoft",
        "option3": "C-Google",
        "option4": "D-Oracle",
        "ans": "C-Google",
  },
  {
      "id": 2,
      "question": "2.Which programming language is used to build Flutter applications?",
        "option1": "A-Kotlin",
        "option2": "B-Dart",
        "option3": "C-Java",
        "option4": "D-Go",
        "ans": "B-Dart",
  },
  {
      "id": 3,
      "question": "3.How many types of widgets are there in Flutter?",
        "option1": "A-2",
        "option2": "B-4",
        "option3": "C-5",
        "option4": "D-8+",
        "ans": "A-2",
  },
  {
      "id": 4,
      "question": "4.When building for iOS, Flutter is restricted to an __ compilation strategy",
        "option1": "A-AOT (ahead-of-time)",
        "option2": "B-JIT (Just-in-time)",
        "option3": "C-Transcompilation",
        "option4": "D-Recompilation",
        "ans": "A-AOT (ahead-of-time)",
  },
  {
      "id": 5,
      "question": "5.A sequence of asynchronous Flutter events is known as a:",
        "option1": "A-Flow",
        "option2": "B-Current",
        "option3": "C-Stream",
        "option4": "D-Series",
        "ans": "C-Stream",
  },
  {
      "id": 6,
      "question": "6.When google release Flutter.",
        "option1": "A-Jan 2017",
        "option2": "B-Jun 2017",
        "option3": "C-May 2017",
        "option4": "D-May 2018",
        "ans": "C-May 2017",
  },
  {
      "id": 7,
      "question": "7.A memory location that holds a single letter or number.",
        "option1": "A-double",
        "option2": "B-int",
        "option3": "C-char",
        "option4": "D-String",
        "ans": "C-char",
  },
  {
      "id": 8,
      "question": "8.What command do you use to output data to the screen?",
        "option1": "A-Cin",
        "option2": "B-Count>>",
        "option3": "C-Cout",
        "option4": "D-Output>>",
        "ans": "C-Cout",
  },
  {
      "id": 9,
      "question": "9.Access to a cloud database through Flutter is available through which service?",
        "option1": "A-SQLite",
        "option2": "B-Firebase Database",
        "option3": "C-NOSQL",
        "option4": "D-MYSQL",
        "ans": "B-Firebase Database",
  },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00FFCB),
        title: Text('Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Expanded(
              child: ListView.builder(
                itemCount: _allUsers.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                   // leading: Text(_allUsers[index]['image']),
                  title: Text(_allUsers[index]['question']),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text('${_allUsers[index]["option1"]}'),
                        SizedBox(height: 10,),
                        Text('${_allUsers[index]["option2"]},'),
                        SizedBox(height: 10,),
                        Text('${_allUsers[index]["option3"]}'),
                        SizedBox(height: 10,),
                        Text('${_allUsers[index]["option4"]}'),
                        SizedBox(height: 15),
                        Text('${_allUsers[index]["ans"]}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
