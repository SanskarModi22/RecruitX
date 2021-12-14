import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup1.dart';
import 'package:helping_hand/Employee/Home/employee_home.dart';
import 'package:helping_hand/Employer/Auth/employer_signup1.dart';
import 'package:helping_hand/Employer/Home/employer_home.dart';
import 'package:helping_hand/Shared/loader.dart';
import 'package:helping_hand/Splash/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/user.dart';
import 'Shared/base.dart';
var option = "";

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  StreamSubscription subscription;
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
  initState() {
    super.initState();
print("hello");
    subscription = Connectivity()
        .onConnectivityChanged
        .listen(showConnectivityResult);
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
  void showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    final message = hasInternet
        ? 'You are connected to network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
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
      } catch (e) {
        print('failed to set them');
      }
    }

    return FutureBuilder(
        future: _setUser(),

        // ignore: missing_return
        builder: (ctx, s) {
          print("isEmployee $isEmployee");
          print("isEmployer $isEmployer");
          print(
              "local employee ${Provider.of<UserType>(context).userAsEmployee}");
          print(
              "local employer ${Provider.of<UserType>(context).userAsEmployer}");
          if (s.connectionState == ConnectionState.waiting) {
            return ColorLoader3();
          } else if (user != null) {
            print(user.uid);
            if ((isEmployer == true &&
                    Provider.of<UserType>(context).userAsEmployer == true) ||
                (isEmployer == true &&
                    isEmployee == false &&
                    Provider.of<UserType>(context).userAsEmployee == false)) {
              print('emplloyer');
              Provider.of<UserType>(context).setUserAsEmployer();

              return EmployerHome();
            } else if ((isEmployee == true &&
                    Provider.of<UserType>(context).userAsEmployee == true) ||
                (isEmployee == true &&
                    isEmployer == false &&
                    Provider.of<UserType>(context).userAsEmployer == false)) {
              Provider.of<UserType>(context).setUserAsEmployee();

              return EmployeeHome();
            } else if (isEmployee == true && isEmployer == true) {
              if (Provider.of<UserType>(context, listen: false)
                      .userAsEmployer ==
                  true) {
                Provider.of<UserType>(context).setUserAsEmployer();

                return EmployerHome();
              } else if (Provider.of<UserType>(context, listen: false)
                      .userAsEmployee ==
                  true) {
                Provider.of<UserType>(context).setUserAsEmployee();

                return EmployeeHome();
              }
            }
          }

          return Provider.of<UserType>(context).isEmployee
              ? EmployeeSignUp()
              : Provider.of<UserType>(context).isEmployer
                  ? EmployerSignUp()
                  : Base(isEmployee: isEmployee,isEmployer: isEmployer,);
        });
  }
}
