import 'dart:convert';

import 'package:customer/models/history_model.dart';
import 'package:http/http.dart' as http;

class HistoryService {
  String baseUrl = 'http://localhost:3000/api/v1';
  Future getHistoryById(
    String token,
    String idUser,
  ) async {
    var url = '$baseUrl/regular/getAllTransaction?id_user=$idUser';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<HistoryModel> history = [];
      for (var item in data) {
        history.add(HistoryModel.fromJson(item));
      }
      return history;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
