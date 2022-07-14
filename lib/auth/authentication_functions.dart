import '../user/person_model.dart';
import 'person_database_helper.dart';

Future<bool> checkCredentials(String login, String password) async {
  bool value = false;
  PersonDatabaseHelper person = PersonDatabaseHelper();

  var info = await person.getPerson(login);

  List<Person> listPerson = [];
  for (var element in info) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }

  for (var element in listPerson) {
    if (element.login == login && element.password == password) {
      value = true;
    }
  }

  return value;
}

String? login;
String? email;
String? password;
getList(List<Person> listPerson) async {
  PersonDatabaseHelper person = PersonDatabaseHelper();
  var info = await person.getPerson(login!);

  for (var element in info) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }
}

Future<List<String>> getInfoList(String login) async {
  PersonDatabaseHelper person = PersonDatabaseHelper();
  var info = await person.getPerson(login);

  List<Person> listPerson = [];
  for (var element in info) {
    Person personObj = Person.fromMapObject(element);
    listPerson.add(personObj);
  }

  List<String> personInfoList = [];

  for (var element in listPerson) {
    login = element.login;
    personInfoList.add(login);
    email = element.email;
    personInfoList.add(email!);
    password = element.password;
    personInfoList.add(password!);
  }

  return personInfoList;
}

Future<List<String>> getPersonList(String login) async {
  List<String> personList;
  personList = await getInfoList(login);
  return personList;
}
