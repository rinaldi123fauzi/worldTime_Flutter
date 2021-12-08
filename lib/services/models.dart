import 'dart:convert';

List<User> allUsers(String str) {
  final jsonData = json.decode(str);
  return new List<User>.from(jsonData.map((x) => User.fromJson(x)));
}

class User {
  String name;
  List<Data> data;

  User({
    required this.name,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return User(
      name: parsedJson['name'],
      data: dataList,
    );
  }
}

class Data {
  final String name;

  Data({
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      name: parsedJson['name'],
    );
  }
}
