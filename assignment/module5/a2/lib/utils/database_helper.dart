//@dart=2.9

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../modals/note.dart';

class Databasehelper
{
  static Databasehelper _databasehelper;

  static Database _database;

  String noteTable = 'note_table';

  String colId = 'id';
  String colTitle = 'title';
  String colescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  Databasehelper._createInstance();

  factory Databasehelper()
  {

    if (_databasehelper == null)
    {
      _databasehelper = Databasehelper._createInstance(); // This is executed only once, singleton object
    }
    return _databasehelper;
  }
  Future<Database> get database async
  {

    if (_database == null)
    {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  Future<int> insertNote(Note note) async
  {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

}