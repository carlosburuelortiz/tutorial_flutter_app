import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserRepository {
  /// ! NOTE base url
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    // ! NOTE path url
    final response = await http.get(Uri.parse('$baseUrl/users'));

    await Future.delayed(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map(
        (item) => User.fromJson(item)
      ).toList();
    } else {
      throw Exception('Error al cargar los usuarios');
    }
  }
}
