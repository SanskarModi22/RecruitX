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
  bool isEmployee = true;
  bool isEmployer = false;
  bool get userAsEmployee {
    return isEmployee;
  }

  bool get userAsEmployer {
    return isEmployer;
  }

  void setUserAsEmployee() async {
    isEmployee = true;
    isEmployer = false;

    print('set as employee');
    // notifyListeners();
  }

  void setUserAsEmployer() async {
    isEmployer = true;
    isEmployee = false;

    print('set as employer');
    // notifyListeners();
  }
}




//TODO:Create a separate collection for employee and employer profile