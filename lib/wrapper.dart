import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Employer/Home/Home.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/Profile/employee_profile.dart';
import 'Model/Profile/employer_profile.dart';
import 'Model/user.dart';
import 'Shared/base.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

var option = "";

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future getValidationData() async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedOption = preferences.getString('option');
    print(obtainedOption);
    setState(() {
      option = obtainedOption;
    });
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2), () {});
      super.initState();
    });
  }

  bool isEmployee = null;
  bool isEmployer = null;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    Future<void> _setUserType() async {
      try {
        // print('step-1 function called');
        final user = await Provider.of<UserType>(context).fetchAndSetUserType();
        setState(() {
          // print('step-2 in the set state');
          isEmployee = user['isEmployee'];
          isEmployer = user['isEmployer'];
        });
        // print('step 3 fetched and set');
        // print(isEmployee);
        // print(isEmployer);
        // loading = false;
      } catch (e) {
        print('error failed to set user type ');
      }
    }

    // print(user.uid);
    if (user != null) {
      // print(user.uid);
      _setUserType();
      // loading = false;

      // FirebaseFirestore.instance
      //     .collection('employerProfile')
      //     .doc(user.uid)
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //     isEmployer = documentSnapshot['isEmployer'];
      //   }
      // });
      // FirebaseFirestore.instance
      //     .collection('employeeProfile')
      //     .doc(user.uid)
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //     isEmployee = documentSnapshot['isEmployee'];
      //   }
      // });

      //   Future<void> getEmployerInstance() async {
      //   await FirebaseFirestore.instance
      //       .collection('employerProfile')
      //       .doc(user.uid)
      //       .get()
      //       .then((DocumentSnapshot documentSnapshot) {
      //     if (documentSnapshot.exists) {
      //       isEmployer = documentSnapshot['isEmployer'];
      //       print(isEmployer);
      //     }
      //   });
      // }

      // Future<void> getEmployeeInstance() async {
      //   await FirebaseFirestore.instance
      //       .collection('employeeProfile')
      //       .doc(user.uid)
      //       .get()
      //       .then((DocumentSnapshot documentSnapshot) {
      //     if (documentSnapshot.exists) {
      //       isEmployee = documentSnapshot['isEmployee'];
      //     }
      //   });
      // }

      // getEmployeeInstance();
      // getEmployerInstance();
      // loading = loading + 1;
      if (isEmployer == true && (isEmployee == false || isEmployee == null)) {
        return EmployerHome();
      } else if ((isEmployer == false || isEmployer == null) &&
          isEmployee == true) {
        return EmployeeHome();
      } else if (isEmployer == true && isEmployee == true) {
        if (Provider.of<UserType>(context, listen: false).userAsEmployer) {
          return EmployerHome();
        } else
          return EmployeeHome();
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    } else {
      return Base();
    }
    // if (user != null) {
    //   return StreamBuilder<Employer>(
    //       stream: DatabaseServices(uid: user.uid).employerData,
    //       builder: (context, snapshot) {
    //         Employer employer = snapshot.data;
    //         if ( snapshot.data!=null) {
    //           return employer.isEmployer==true?EmployerHome():
    //         } else {
    //         return  StreamBuilder<Employee>(
    //               stream: DatabaseServices(uid: user.uid).empData,
    //               builder: (context, snap) {
    //                 Employee emp = snap.data;
    //                 if (snap.data!=null) {
    //                   return emp.isEmployee==true?EmployeeHome():Base();
    //                 } else
    //                   return Base();
    //               });
    //         }
    //       });
    // } else {
    //   return Base();
    // }
  }
}
