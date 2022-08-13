class Person {
  Person(
    this._login,
    this._email,
    this._password,
    this._date,
  );

  Person.fromMapObject(Map<String, dynamic> map) {
    _login = map['login'] as String;
    _email = map['email'] as String;
    _password = map['password'] as String;
    _date = map['date'] as String;
  }
  String? _login;
  String? _email;
  String? _password;
  String? _date;

  String get login => _login!;
  String get email => _email!;
  String get password => _password!;
  String get date => _date!;

  set login(String newLogin) {
    _login = newLogin;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set password(String newPassword) {
    _password = newPassword;
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['login'] = _login;
    map['email'] = _email;
    map['password'] = _password;
    map['date'] = _date;
    return map;
  }
}
