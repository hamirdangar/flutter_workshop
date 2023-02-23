//@dart=2.9
import 'package:flutter/material.dart';
import 'Screen/todo_list.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
        home: TodoListPage(),
    )
  );
}