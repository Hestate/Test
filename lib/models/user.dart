import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0, defaultValue: '')
  String nickname;

  @HiveField(1, defaultValue: '')
  String email;

  @HiveField(2, defaultValue: '')
  String password;

  @HiveField(3, defaultValue: '')
  String date;

  User({
    required this.nickname,
    required this.email,
    required this.password,
    required this.date,
  });
}
