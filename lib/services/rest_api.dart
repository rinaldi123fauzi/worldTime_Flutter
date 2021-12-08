import 'models.dart';

import 'package:http/http.dart' as http;

class RestApi {
  String url = 'https://countriesnow.space/api/v0.1/countries/flag/images';

  Future<List<User>> getUsers() async {
    final response = await http.get('$url');
    print(response.body);
    return allUsers(response.body);
  }
}