import 'dart:async';

import 'package:auth_app/models/person_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class PersonDatabaseHelper {
  factory PersonDatabaseHelper() {
    //initializing the object
    _personDatabaseHelper ??= PersonDatabaseHelper._createInstance();
    return _personDatabaseHelper!;
  }

  PersonDatabaseHelper._createInstance();
  static PersonDatabaseHelper?
      _personDatabaseHelper; //Singleton object of the class

  static Database? _database;

  String personTable = 'personsTable';
  String personLogin = 'login';
  String personEmail = 'email';
  String personPassword = 'password';

  // Getter for our database
  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  // Function to initialize the database
  Future<Database> initializeDatabase() async {
    // Getting directory path for both Android and Ios

    final directory = await getApplicationDocumentsDirectory();

    final path = '${directory.path}person.db';

    // Open or create database at a given path.
    final personDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    // _createDb(personDatabase, 1);
    // print("Table created");

    return personDatabase;
  }

  // Function for creating a Database,
  Future<void> _createDb(Database db, int newVersion) async {
    if (_database == null) {
      await db.execute(
          'CREATE TABLE personsTable ($personLogin TEXT PRIMARY KEY, $personEmail TEXT, $personPassword VARCHAR)',);
    }
  }

  // Functions for CRUD operations

  //Fetch operation
  Future<List<Map<String, dynamic>>> getPerson(String login) async {
    final db = await database;

    final result = await db.rawQuery(
        "SELECT * FROM $personTable WHERE $personLogin = '$login' ",);
    return result;
  }

  // Insert Operation
  Future<int> insertPerson(Person person) async {
    final db = await database;

    final result = await db.insert(personTable, person.toMap());
    return result;
  }

  // Update Operation
  Future<int> updatePerson(Person person) async {
    final db = await database;

    //var result = await db.rawUpdate(sql)
    final result = await db.update(personTable, person.toMap(),
        where: '$personLogin = ?', whereArgs: [person.login],);
    return result;
  }

  // Change User Details.

  // Delete Operation
  Future<int> deletePerson(String login) async {
    final db = await database;

    final result = await db
        .rawDelete('DELETE FROM $personTable WHERE $personLogin = $login');
    return result;
  }
}
