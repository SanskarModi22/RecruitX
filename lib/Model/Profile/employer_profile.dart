import 'dart:io';

import '../review.dart';
import '../shop.dart';

class Employer {
  String uid;

  String employerName;
  String employerAddress;
  String employerContactNumber;
  String employerBio;
  String employerAge;
  String employerDOB;
  double averageRating;
  String aadhar;
  String shopDesc;
  String city;
  String state;
  File lienseImg;
bool isEmployer=false;
bool isEmployee;
String shopName;
  List<ReviewByEmployee> reviews = [];
  List<Shop> shops = [];
  Employer({
    this.aadhar,
    this.employerAddress,
    this.employerAge,
    this.uid,
    this.employerBio,
    this.employerContactNumber,
    this.employerName,
    this.employerDOB,
    this.reviews,
    this.shops,
    this.averageRating,
    this.shopName,
    this.shopDesc,
    this.city,
    this.state,
    this.isEmployer,
    this.isEmployee,
    this.lienseImg,
  });
}
//TODO: Add and update user
//TODO: Delete user
//TODO: Read User