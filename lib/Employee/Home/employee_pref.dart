import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'Job-Details/job_list.dart';

// ignore: must_be_immutable
class EmployeeJobPreferences extends StatelessWidget {
  EmployeeJobPreferences({Key key}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<String> Pref = ["Driving", "Washing", "Maid"];
  var Jobs = {
    "Driver": Icons.drive_eta_rounded,
    "Peon": FontAwesomeIcons.broom,
    "Security Guard": FontAwesomeIcons.shieldAlt,
    "Labour": FontAwesomeIcons.hammer,
    "Halwai": FontAwesomeIcons.utensils,
    "Watchman": FontAwesomeIcons.userShield,
    "Waiter": FontAwesomeIcons.userTie,
    "Maid": FontAwesomeIcons.handsWash,
    "Delivery Boy": FontAwesomeIcons.biking,
    "Tutor":FontAwesomeIcons.book,
  };
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cUser)
            .snapshots(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            return Container(
height: 100.h,
              child: ListView.builder(
                physics:NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snap.data['expectedJobs'].length,
                  itemBuilder: (ctx, index) {
                    print(snap.data['expectedJobs'].length);
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('jobs')
                            .where('jobName',
                                isEqualTo: snap.data['expectedJobs'][index])
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding:  EdgeInsets.all(2.w),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobList(text: snap.data['expectedJobs'][index],),
                                      ));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                                  color:
                                  (index % 2) == 0 ? Colors.cyan[300] : Colors.yellow,
                                  shadowColor: Colors.transparent,
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    leading: CircleAvatar(
                                      radius: 4.8.w,
                                      child: Icon(Jobs[snap.data['expectedJobs'][index]]),
                                    ),
                                    title: Text(
                                      snap.data['expectedJobs'][index],
                                      style: TextStyle(
                                          fontSize: 4.225.w,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Text(
                                        "${snapshot.data.docs.length} jobs availaible",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 3.9.w,
                                        ),
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ),
                            );
                          } else
                            return Center(
                              child: CircularProgressIndicator(
                              ),
                            );
                        });
                  }),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
