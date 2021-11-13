import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup1.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Employer/Auth/employer_signup1.dart';
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

  // @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Timer(Duration(seconds: 2), () {});
  //     super.initState();
  //   });
  // }
  // final cUser = FirebaseAuth.instance.currentUser.uid;

  bool isEmployee = false;
  bool isEmployer = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    // print(user.uid);
    Future<void> _setUser() async {
      try {
        await FirebaseFirestore.instance
            .collection('employerProfile')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            isEmployer = documentSnapshot['isEmployer'];
          }
          if (!documentSnapshot.exists) {
            isEmployer = false;
          }
        });
        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            isEmployee = documentSnapshot['isEmployee'];
          }
          if (!documentSnapshot.exists) {
            isEmployee = false;
          }
        });
        print('success!');
        // print(isEmployee);
        // print(isEmployer);
      } catch (e) {
        print('failed to set them');
      }
    }

    // if (user != null) {
    //   bool isEmployer;
    //   bool isEmployee;
    // }

    // Future<void> _setUserType() async {
    //   try {
    //     // print('step-1 function called');
    //     final user = await Provider.of<UserType>(context).fetchAndSetUserType();
    //     setState(() {
    //       // print('step-2 in the set state');
    //       isEmployee = user['isEmployee'];
    //       isEmployer = user['isEmployer'];
    //     });
    //     // print('step 3 fetched and set');
    //     // print(isEmployee);
    //     // print(isEmployer);
    //     // loading = false;
    //   } catch (e) {
    //     print('error failed to set user type ');
    //   }
    // }

    return FutureBuilder(
        future:
            // Future.delayed(Duration(seconds: 3), () {
            _setUser(),
        // }),
        // ignore: missing_return
        builder: (ctx, s) {
          print("isEmployee $isEmployee");
          print("isEmployer $isEmployer");
          print("local employee ${Provider.of<UserType>(context).userAsEmployee}");
          print("local employer ${Provider.of<UserType>(context).userAsEmployer}");
          if (s.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (user != null) {
            print(user.uid);
            if ((isEmployer == true &&
                Provider.of<UserType>(context).userAsEmployer==true)||(isEmployer==true&&isEmployee==false&&Provider.of<UserType>(context).userAsEmployee==false)) {
              print('emplloyer');
              Provider.of<UserType>(context).setUserAsEmployer;
              print("ullapullla");
              return EmployerHome();
            }
           else if ((isEmployee == true &&
                Provider.of<UserType>(context).userAsEmployee==true)||(isEmployee==true&&isEmployer==false&&Provider.of<UserType>(context).userAsEmployer==false)) {
              Provider.of<UserType>(context).setUserAsEmployee;

              return EmployeeHome();
            }
            else if (isEmployee == true && isEmployer == true) {
              if (Provider.of<UserType>(context, listen: false)
                      .userAsEmployer ==
                  true) {
                Provider.of<UserType>(context).setUserAsEmployer;

                return EmployerHome();
              } else if(Provider.of<UserType>(context, listen: false)
                  .userAsEmployee ==
                  true) {
                return EmployeeHome();
              }
            }
          }

          return Provider.of<UserType>(context).isEmployee
              ? EmployeeSignUp()
              : Provider.of<UserType>(context).isEmployer
                  ? EmployerSignUp()
                  : Base();
        });
  }
}


// user!= null ? {
        
//          // _setUserType();
//          // _setUser();
//          // print(isEmployee);
//          // print(isEmployer);
//          // screen();
//          if (isEmployer == true &&
//              (isEmployee == false || isEmployee == null)) {
//            // print('check1');

//            return EmployerHome();
//          } else if ((isEmployer == false || isEmployer == null) &&
//              isEmployee == true) {
//            return EmployeeHome();
//          } else if (isEmployer == true && isEmployee == true) {
//            if (Provider.of<UserType>(context, listen: false).userAsEmployer) {
//              return EmployerHome();
//            } else
//              return EmployeeHome();
//          } else {
// //         return Base();

//            return Scaffold(
//              body: Center(
//                child: CircularProgressIndicator(),
//              ),
//            );
//          }
//        } ,
//       } 
       