import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

class Repository {
  final _baseurl = 'https://reqres.in/api/users?page=1&per_page=10';

  Future<List<User>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        final Iterable<dynamic> data = jsonDecode(response.body)['data'];
        List<User> users = data.map((e) => User.fromJson(e)).toList();

        return users;
      }
    } catch (e) {
      print(e.toString());
    }

    return []; // Return empty list if there's an error
  }
}