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
  });
}
//TODO: Add and update user
//TODO: Delete user
//TODO: Read User