class Person {
  String? _login;
  String? _email;
  String? _password;

  Person(
    this._login,
    this._email,
    this._password,
  );

  String get login => _login!;
  String get email => _email!;
  String get password => _password!;

  set login(String newLogin) {
    if (newLogin != null) {
      this._login = newLogin;
    }
  }

  set email(String newEmail) {
    if (newEmail != null) {
      this._email = newEmail;
    }
  }

  set password(String newPassword) {
    if (newPassword != null) {
      this._password = newPassword;
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['login'] = _login;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

  Person.fromMapObject(Map<String, dynamic> map) {
    _login = map['login'];
    _email = map['email'];
    _password = map['password'];
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // @override
  // String toString() {
  //   return 'Person {fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password, birthDate: $birthDate, gender: $gender}';
  // }
}
