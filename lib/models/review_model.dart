import 'package:customer/models/detail_review.dart';

class ReviewModel {
  late int allReviews;
  late int avgReviews;
  late List<DetailReviewModel> detailReviewModel;

  ReviewModel({
    required this.allReviews,
    required this.avgReviews,
    required this.detailReviewModel,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    allReviews = json['allReviews'];
    avgReviews = json['avgReviews'];

    detailReviewModel = json['data']
        .map<DetailReviewModel>((e) => DetailReviewModel.fromJson(e))
        .toList();
  }
  Map<String, dynamic> toJson() {
    return {
      'allReviews': allReviews,
      'avgReviews': avgReviews,
      'data': detailReviewModel.map((e) => e.toJson()).toList(),
    };
  }
}
