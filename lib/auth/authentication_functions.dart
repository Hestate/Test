import 'package:auth_app/auth/person_database_helper.dart';
import 'package:auth_app/models/person_model.dart';

Future<bool> checkCredentials(String login, String password) async {
  var value = false;
  final person = PersonDatabaseHelper();

  final info = await person.getPerson(login);

  final listPerson = <Person>[];
  for (final element in info) {
    final personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }

  for (final element in listPerson) {
    if (element.login == login && element.password == password) {
      value = true;
    }
  }

  return value;
}

String? login1;
String? email;
String? password;
String? date;
Future<List<Person>> getList(List<Person> listPerson) async {
  final person = PersonDatabaseHelper();
  final info = await person.getPerson(login1!);

  for (final element in info) {
    final personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }

  return listPerson;
}

Future<List<String>> getInfoList(String login) async {
  final person = PersonDatabaseHelper();
  final info = await person.getPerson(login);

  final listPerson = <Person>[];
  for (final element in info) {
    final personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }

  final personInfoList = <String>[];

  for (final element in listPerson) {
    login1 = element.login;
    personInfoList.add(login1!);
    email = element.email;
    personInfoList.add(email!);
    password = element.password;
    personInfoList.add(password!);
    date = element.date;
    personInfoList.add(date!);
  }

  return personInfoList;
}

Future<List<String>> getPersonList(String login) async {
  List<String> personList;
  personList = await getInfoList(login);
  return personList;
}
