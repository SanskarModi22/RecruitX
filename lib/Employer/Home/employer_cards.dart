import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Employee-Details/employee_list.dart';

class EmployeeCards extends StatefulWidget {
  const EmployeeCards({key}) : super(key: key);

  @override
  _EmployeeCardsState createState() => _EmployeeCardsState();
}

class _EmployeeCardsState extends State<EmployeeCards> {
  // ignore: non_constant_identifier_names
  List<String> PopularJobs = [
    "Tutor",
    "Labour",
    "Waiter",
    "Maid",
    "Driver",
    "Watchman",
    "Halwai",
    "Peon",
    "Security Guard",
    "Delivery Boy"
  ];
  // var len;
  // // ignore: non_constant_identifier_names
  // List<String> JobAvailable = ["15", "27", "18", "19", "20", "21"];
  // getUsersPastTripsStreamSnapshots(String job) async {
  //   // final user = Provider.of<MyUser>(context);
  //   var data =
  //   await FirebaseFirestore.instance.collection('employeeProfile').where("expectedJobs",arrayContains: job).get();
  //
  // len=data.docs.length;
  //
  //   return len;
  // }

  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: PopularJobs.length,
          itemBuilder: (ctx, index) {
            return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('employeeProfile')
                    .where("expectedJobs", arrayContains: PopularJobs[index])
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding:  EdgeInsets.all(6.1.sp),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeList(
                                  text: PopularJobs[index],
                                  salary: 100000,
                                  partTime: false,
                                  nightShift: false,
                                ),
                              ));
                        },
                        child: Card(
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          child: Container(
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: (index % 2) == 0
                                    ? Colors.purple[300]
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    PopularJobs[index],
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    width: 90.w,
                                    child: Text(
                                      "${snapshot.data.docs.length} employees are availaible",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  } else
                    return Center(
                      child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator()),
                    );
                });
          }),
    );
  }
}
