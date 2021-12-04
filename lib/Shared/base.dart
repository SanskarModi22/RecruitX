import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employer/Auth/login_employer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:sizer/sizer.dart';

class Base extends StatefulWidget {
  Base({key,this.isEmployer,this.isEmployee}) : super(key: key);
bool isEmployer;
bool isEmployee;
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  StreamSubscription subscription;
  @override
  initState() {
    super.initState();
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
        ? 'You are connected to Network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height.toDouble();
    print("w=${1.w}");
    print("h=${1.h}");
    print("sp=${1.sp}");
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          alignment: Alignment.center,
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(top: 25.h),
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      "Who Are You?",
                      style: GoogleFonts.scheherazade(
                        fontSize: 13.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 9.49.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 26.9.sp,
                                backgroundImage:
                                    AssetImage('assets/images/employer.png'),
                              ),
                            ),
                            SizedBox(
                              height: 3.75.h,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 150),
                                primary: Colors.green,
                                fixedSize: Size(140, 50),
                                elevation: 15,
                              ),
                              // onPressed: () async{
                              //   SharedPreferences.setMockInitialValues({});
                              //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                              //   preferences.setString(
                              //       'option','1' );
                              onPressed: () {
                                Provider.of<UserType>(context, listen: false)
                                    .setUserAsEmployer();

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginEmployer(isEmployer: widget.isEmployer??false,),
                                  ),
                                );
                              },
                              child: Text(
                                'Employer',
                                style: GoogleFonts.scheherazade(
                                  fontSize: 7.w,
                                  color: Colors.white,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Or",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 5.w),),

                      Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 9.49.w,
                              child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 8.7.w,
                                  backgroundImage:
                                      AssetImage('assets/images/employee.png')),
                            ),
                            SizedBox(
                              height: 3.75.h,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 15,
                                side: BorderSide(width: 37.5.w),
                                primary: Colors.green,
                                fixedSize: Size(35.w, 6.25.h),
                              ),
                              // onPressed: () async{
                              //   SharedPreferences.setMockInitialValues({});
                              //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                              //   preferences.setString(
                              //       'option','2' );
                              onPressed: () {
                                Provider.of<UserType>(context, listen: false)
                                    .setUserAsEmployee();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginEmp(isEmployee: widget.isEmployee??false,),
                                  ),
                                );
                              },
                              child: Text(
                                'Employee',
                                style: GoogleFonts.scheherazade(
                                  fontSize: 7.w,
                                    color: Colors.white,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    /* children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(40, 45)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => EmployerBase(),
                            ),
                          )
                        },
                        child: Text(
                          "Employer",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 19.0),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(40, 45)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EmployeeBase()),
                          )
                        },
                        child: Text(
                          "Employee",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 19.0),
                        ),
                      ),
                    ],*/
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
