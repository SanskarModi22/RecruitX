import 'package:flutter/material.dart';

class ReviewByEmployee {
  final String reviewerId;
  final double rating;
  final String reviewerName;
  final String jobWorked;
  final String reviewPara;
  final String profileImageURL;
  final String backgroundImageURL;
  ReviewByEmployee({
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
  final double rating;
  final String reviewerShopName;
  final String jobWorked;
  final String reviewPara;
  ReviewByEmployer({
    @required this.rating,
    @required this.jobWorked,
    @required this.reviewerShopName,
    this.reviewPara,
  });
}
