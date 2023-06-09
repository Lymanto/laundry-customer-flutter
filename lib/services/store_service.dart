import 'dart:convert';

import 'package:customer/models/store_model.dart';
import 'package:http/http.dart' as http;

class StoreService {
  String baseUrl = 'http://localhost:3000/api/v1';

  Future getStore(
    String token,
  ) async {
    var url = '$baseUrl/regular/getAllStore';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': '$token',
    };
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<StoreModel> store = [];
      for (var item in data) {
        store.add(StoreModel.fromJson(item));
      }
      return store;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future getStoreByService(
    String token,
    String serviceName,
  ) async {
    var url =
        '$baseUrl/regular/getAllStoreWithService?service_name=$serviceName';
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
      List<StoreModel> store = [];
      for (var item in data) {
        store.add(StoreModel.fromJson(item));
      }
      return store;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
