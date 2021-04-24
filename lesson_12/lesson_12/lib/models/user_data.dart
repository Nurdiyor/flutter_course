import 'package:lesson_12/main.dart';

class User {
  int id;
  String name;
  String number;
  static const String TABLE_NAME = "user";

  User({this.id, this.name, this.number});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "number": number
    };
  }
}
