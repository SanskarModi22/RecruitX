import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/employee_Custom_Search.dart';
import 'package:helping_hand/Employee/Home/employee_pref.dart';

import 'package:helping_hand/Employee/Home/employee_cards.dart';
import 'package:helping_hand/drawer/drawer.dart';

import 'package:helping_hand/Employee/Home/job_options.dart';
import 'package:helping_hand/screens/employee_profile_screen.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:sizer/sizer.dart';

import 'Job-Details/job_list.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({key}) : super(key: key);

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
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
        ? 'You are connected to network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
  @override
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    // print("sp=${1.sp}");
    // print("w=${1.w}");
    // print("h=${1.h}");
    return SafeArea(
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('employeeProfile')
              .doc(cUser)
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.pink[600],
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => EmployeeProfile(data.id)));
                        },
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundImage: NetworkImage(data['img_url']),
                        ),
                      ),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          color: Colors.pink[600],
                          height: 26.4.h,
                          width: 100.w,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.sp, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello ${data['name']}",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "Find Your Dream Job",
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20.w, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          EmployeeCustomSearch(),
                                          // SizedBox(
                                          //   width: 6.w,
                                          // ),
                                          // Container(
                                          //   height: 100,
                                          //   child: Column(
                                          //     children: [
                                          //       Align(
                                          //         alignment: Alignment.center,
                                          //         child: ElevatedButton(
                                          //           style: ButtonStyle(
                                          //               minimumSize: MaterialStateProperty.all(
                                          //                   Size(4.w, 6.h)),
                                          //               shape: MaterialStateProperty.all(
                                          //                   RoundedRectangleBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius.circular(14.sp),
                                          //               )),
                                          //               backgroundColor:
                                          //                   MaterialStateProperty.all(
                                          //                       Colors.white)),
                                          //           onPressed: () {
                                          //             Navigator.of(context).push(
                                          //               MaterialPageRoute(
                                          //                 builder: (context) => JobList(),
                                          //               ),
                                          //             );
                                          //           },
                                          //           child: Container(
                                          //             child: Image.asset(
                                          //               "assets/images/filter.png",
                                          //               height: 4.h,
                                          //               fit: BoxFit.fill,
                                          //               color: Colors.blue,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            JobOptions(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                                child: Text(
                              "High Paying Jobs",
                              style: TextStyle(
                                fontSize: 18.4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            SizedBox(
                              height: 1.h,
                            ),
                            JobCards(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                "Related To your Role",
                                style: TextStyle(
                                  fontSize: 18.4.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            EmployeeJobPreferences()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                drawer: drawer(),
              );
            } else {
              return Container(
                  height: 2.h,
                  width: 5.w,
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
