import 'dart:convert';

import 'package:customer/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://localhost:3000/api/v1';

  Future<UserModel> login({required String noHP}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'no_hp': noHP,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token_bearer'];
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
