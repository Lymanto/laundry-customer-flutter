import 'package:customer/models/review_model.dart';
import 'package:customer/services/review_service.dart';
import 'package:flutter/material.dart';

class ReviewProvider with ChangeNotifier {
  late ReviewModel _review;
  ReviewModel get review => _review;
  set review(ReviewModel review) {
    _review = review;
    notifyListeners();
  }

  Future<void> getReviewByStoreId(
    String token,
    String idStore,
  ) async {
    try {
      ReviewModel reviews =
          await ReviewService().getReviewByStoreId(token, idStore);
      _review = reviews;
    } catch (e) {
      print(e);
    }
  }
}
