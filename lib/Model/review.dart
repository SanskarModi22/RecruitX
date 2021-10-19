import 'package:flutter/material.dart';

class ReviewByEmployee {
  final String reviewerId;
  final String reviewId;
  final double rating;
  final String reviewerName;
  final String jobWorked;
  final String reviewPara;
  final String profileImageURL;
  final String backgroundImageURL;
  ReviewByEmployee({
    this.reviewId,
    @required this.reviewerId,
    @required this.rating,
    @required this.jobWorked,
    @required this.reviewerName,
    this.reviewPara,
    this.backgroundImageURL,
    this.profileImageURL,
  });
}

class ReviewByEmployer {
  final String reviewId;
  final String reviewerId;
  final double rating;
  final String reviewerShopName;
  final String jobWorked;
  final String shopImageUrl;
  final String reviewPara;
  ReviewByEmployer({
    this.reviewId,
    this.reviewerId,
    @required this.rating,
    @required this.jobWorked,
    @required this.reviewerShopName,
    this.reviewPara,
    this.shopImageUrl,
  });
}
