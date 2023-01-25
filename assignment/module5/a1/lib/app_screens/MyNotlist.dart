//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteex/modals/note.dart';

import 'NoteDitle.dart';

class MyNotlist extends StatefulWidget
{
  @override
  _MyNotlistState createState() => _MyNotlistState();


  }

class _MyNotlistState extends State<MyNotlist>
{
  @override
  Widget build(BuildContext context) {
   return Scaffold
     (
     appBar: AppBar
       (
        title:  Text('notes'),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {

          debugPrint('FAB click');
          navigetdatle(Note('', '', 2),'Add Note');

      },
        tooltip: 'Add note',
        child: Icon(Icons.add),

      ),


   );
  }

  void navigetdatle(Note note, String s) async{
     bool result=await Navigator.push(context, MaterialPageRoute(builder: (context)
     {
       return NoteDetail(note, s);
       },
     ));
     if(result==true)
       {
         Updetelistview();
       }
  }

  void Updetelistview() {

  }

}
