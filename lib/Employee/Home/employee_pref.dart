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
    "Delivery Man": FontAwesomeIcons.biking,
    "Tutor":FontAwesomeIcons.book,
  };
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cUser)
            .get(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            return Container(
              height: 40.h,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snap.data['expectedJobs'].length,
                  itemBuilder: (ctx, index) {
                    print(snap.data['expectedJobs'].length);
                    return FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('jobs')
                            .where('jobName',
                                isEqualTo: snap.data['expectedJobs'][index])
                            .get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                      radius: 15.sp,
                                      child: Icon(Jobs[snap.data['expectedJobs'][index]]),
                                    ),
                                    title: Text(
                                      snap.data['expectedJobs'][index],
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Text(
                                        "${snapshot.data.docs.length} jobs availaible",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
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
