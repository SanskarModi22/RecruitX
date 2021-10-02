import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Custom_Search.dart';
import 'package:helping_hand/Employee/Home/employee_pref.dart';
import 'package:helping_hand/Employee/Home/filter.dart';

import 'package:helping_hand/Employee/Home/searchBar.dart';
import 'package:helping_hand/cards.dart';
import 'package:helping_hand/drawer/drawer.dart';
import 'package:helping_hand/job_options.dart';
import 'package:sizer/sizer.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({key}) : super(key: key);

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[600],
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            CircleAvatar(
              radius: 20.sp,
              child: Image.asset(
                "assets/images/avatar.png",
                height: 7.h,
                fit: BoxFit.cover,
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
                    // SizedBox(
                    //   height: 3.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.sp, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Sanskar",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                            Row(
                              children: [
                                CustomSearch(),
                                SizedBox(
                                  width: 6.w,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(4.w, 6.h)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.sp),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {},
                                  child: Container(
                                    child: Image.asset(
                                      "assets/images/filter.png",
                                      height: 4.h,
                                      fit: BoxFit.fill,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
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
                        fontSize: 24.0,
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
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    EmpPref()
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: drawer(),
      ),
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
