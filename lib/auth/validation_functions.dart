validateLogin(String value) {
  if (value.isEmpty) {
    return "Please enter your login.";
  }
}

validateEmail(String value) {
  if (value.isEmpty) {
    return "Please enter your email.";
  }

  const emailPattern = r'[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regEx = RegExp(emailPattern);

  if (!regEx.hasMatch(value)) {
    return "Enter a valid email.";
  }
}

validatePassword(String value) {
  if (value.isEmpty) {
    return "Password is required.";
  }
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return "Password must contain atleast 1 uppercase min. 1 lowercase, 1 special character, min. 1 numeric char.";
  } else if (value.length < 8) {
    return "Password should atleast be of 8 characters.";
  }
}
