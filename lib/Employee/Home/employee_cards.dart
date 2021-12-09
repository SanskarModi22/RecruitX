import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:sizer/sizer.dart';

class JobCards extends StatefulWidget {
  const JobCards({key}) : super(key: key);

  @override
  _JobCardsState createState() => _JobCardsState();
}

class _JobCardsState extends State<JobCards> {
  // ignore: non_constant_identifier_names
  List<String> PopularJobs = [
    "Halwai",
    "Peon",
    "Tutor",
    "Driver",
    "Watchman",
    "Labour",
    "Waiter",
    "Maid",
    "Security Guard",
    "Delivery Boy"
  ];

  @override

  // ignore: non_constant_identifier_names
  // List<String> JobAvailable = [
  //   "15",
  //   "27",
  //   "18",
  //   "19",
  //   "20",
  //   "21",
  // ];

  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: PopularJobs.length,
          itemBuilder: (ctx, index) {
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('jobs')
                    .where("jobName", isEqualTo: PopularJobs[index])
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(1.9.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobList(
                                text: PopularJobs[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          child: Container(
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: (index % 2) == 0
                                    ? Colors.purple[300]
                                    : Colors.orange[300],
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    PopularJobs[index],
                                    style: TextStyle(
                                        fontSize: 4.8.w,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    width: 90.w,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Text(
                                        "${snapshot.data.docs.length} jobs are availaible",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 4.5.w),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                        width: 5.w,
                        height: 2.5.h,
                        child: Center(child: CircularProgressIndicator()));
                  }
                });
          }),
    );
  }
}
