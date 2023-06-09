import 'dart:convert';

import 'package:customer/models/review_model.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  String baseUrl = 'http://localhost:3000/api/v1';
  Future getReviewByStoreId(
    String token,
    String idStore,
  ) async {
    var url = '$baseUrl/basic/review/getAllReview?id_store=$idStore';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      ReviewModel review = ReviewModel.fromJson(data);

      return review;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
