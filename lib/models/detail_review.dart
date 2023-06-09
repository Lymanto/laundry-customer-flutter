import 'package:customer/models/detail_user_review.dart';

class DetailReviewModel {
  late String id;
  late int rating;
  late String description;
  late DetailUserReview user;
  late DateTime createdAt;
  late DateTime updatedAt;

  DetailReviewModel({
    required this.id,
    required this.rating,
    required this.description,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  DetailReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id_review'];
    rating = json['rating'];
    description = json['description'];
    user = DetailUserReview.fromJson(json['id_user']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id_review': id,
      'rating': rating,
      'description': description,
      'id_user': user.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
