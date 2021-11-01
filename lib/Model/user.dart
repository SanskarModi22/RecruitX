import 'package:flutter/cupertino.dart';

class MyUser {
  String uid;
bool isEmployer;
bool isEmployee;
String name;
  MyUser({
    this.uid,
    this.isEmployer,
    this.isEmployee,
    this.name,
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




//TODO:Create a separate collection for employee and employer profile