import 'dart:convert';

import 'package:customer/models/promo_model.dart';
import 'package:http/http.dart' as http;

class PromoService {
  String baseUrl = 'http://localhost:3000/api/v1';
  Future getPromo(
    String token,
  ) async {
    var url = '$baseUrl/store/getAllPromo';
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
      List<PromoModel> promo = [];
      for (var item in data) {
        promo.add(PromoModel.fromJson(item));
      }
      return promo;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
