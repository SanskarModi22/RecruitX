import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/employee_Custom_Search.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:helping_hand/Employee/Home/employee_pref.dart';

import 'package:helping_hand/Employee/Home/employee_cards.dart';
import 'package:helping_hand/Employer/Home/employer_preference.dart';
import 'package:helping_hand/Model/Profile/employer_profile.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/drawer/drawer.dart';

import 'package:helping_hand/Employee/Home/job_options.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import 'employee_options.dart';
import 'employer_cards.dart';
import 'employer_custom_search.dart';

class EmployerHome extends StatefulWidget {
  const EmployerHome({key}) : super(key: key);

  @override
  _EmployerHomeState createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {
  // final user = Provider.of<MyUser>(context);
  final cUser = FirebaseAuth.instance.currentUser.uid;
  // var data;
  // var result;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   result = getEmployerData();
  // }
  // Future <void> getEmployerData() async{
  //   try{
  //     data =
  //   await FirebaseFirestore.instance.collection('employerProfile').doc(cUser).get();
  //   }
  //   catch(err){
  //     print(err.toString());
  //   }
  //
  // }
  // @override
  //  initState()  {
  //   super.initState();
  //    getEmployerData();
  // }
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
  @override
  Widget build(BuildContext context) {
// print(data['name'].toString());
    return SafeArea(
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('employerProfile')
              .doc(cUser)
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.greenAccent,
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: CircleAvatar(
                          radius: 20.sp,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            data['employerImg'],
                            //  width: 10.w,
                          )),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          color: Colors.greenAccent,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Find Your Employee",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        EmployerCustomSearch(),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        // ElevatedButton(
                                        //   style: ButtonStyle(
                                        //       minimumSize: MaterialStateProperty.all(
                                        //           Size(4.w, 6.h),),
                                        //       shape: MaterialStateProperty.all(
                                        //           RoundedRectangleBorder(
                                        //             borderRadius:
                                        //             BorderRadius.circular(14.sp),
                                        //           )),
                                        //       backgroundColor:
                                        //       MaterialStateProperty.all(
                                        //           Colors.white)),
                                        //   onPressed: () {
                                        //     Navigator.of(context).push(
                                        //       MaterialPageRoute(
                                        //         builder: (context) => JobList(),
                                        //       ),
                                        //     );
                                        //   },
                                        //   child: Container(
                                        //     child: Image.asset(
                                        //       "assets/images/filter.png",
                                        //       height: 4.h,
                                        //       fit: BoxFit.fill,
                                        //       color: Colors.blue,
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            EmployeeOptions(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                                child: Text(
                              "Availaible Employees",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            SizedBox(
                              height: 1.h,
                            ),
                            EmployeeCards(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                "Related To your Preference",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            EmployerEmployeePreference()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                drawer: drawer(),
              );
            } else {
              return CircularProgressIndicator();
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
