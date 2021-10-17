import 'package:flutter/cupertino.dart';

import 'review.dart';
import 'shop.dart';

class MyUser {
  String uid;

  MyUser({
    this.uid,
  });
}

class UserType with ChangeNotifier {
  bool isEmployee = false;
  bool isEmployer = false;
  bool get userAsEmployee {
    return isEmployee;
  }

  bool get userAsEmployer {
    return isEmployer;
  }

  void setUserAsEmployee() {
    isEmployee = true;
    isEmployer = false;
  }

  void setUserAsEmployer() {
    isEmployer = true;
    isEmployee = false;
  }
}

class Employee {
  String uid;
  String employeeName;
  String employeeAddress;
  String employeeContactNumber;
  String employeeBio;
  String employeeAge;
  String employeeDOB;
  String employeeExperience;

  String employeeExpectedSalary;
  String employeeExpectedJobs;
  String currentlyWorkingAt;
  String preferredJobType;
  String employeePreferedShift;
  double averageRating;
// non  values
  List<ReviewByEmployer> reviews = [];

  Employee({
    this.uid,
    this.employeeAddress,
    this.employeeAge,
    this.employeeBio,
    this.employeeContactNumber,
    this.employeeExperience,
    this.employeeName,
    this.employeeDOB,
    this.employeeExpectedJobs,
    this.employeeExpectedSalary,
    this.employeePreferedShift,
    this.averageRating,
    this.currentlyWorkingAt,
    this.preferredJobType,
    // non  values
    this.reviews,
  });
}

class Employer {
  String uid;

  String employerName;
  String employerAddress;
  String employerContactNumber;
  String employerBio;
  String employerAge;
  String employerDOB;
  double averageRating;

  List<ReviewByEmployee> reviews = [];
  List<Shop> shops = [];
  Employer({
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
