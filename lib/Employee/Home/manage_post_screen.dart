import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_detail.dart';
import 'package:random_color/random_color.dart';
import 'package:sizer/sizer.dart';

class ManagePostForEmployee extends StatefulWidget {
  // const ManagePostForEmployee({ Key? key }) : super(key: key);

  @override
  _ManagePostForEmployeeState createState() => _ManagePostForEmployeeState();
}

class _ManagePostForEmployeeState extends State<ManagePostForEmployee> {
  @override
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(cUser)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final List appliedJobs = snapshot.data['appliedJobs'];
        if (appliedJobs.isEmpty || appliedJobs == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Manage Applications'),
            ),
            body: Center(
              child: Text('Not Applied Anywhere'),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Manage Applications'),
          ),
          body: ListView.builder(
            itemCount: appliedJobs.length,
            itemBuilder: (ctx, i) {
              return AppliedJob(appliedJobs[i]);
            },
          ),
        );
      },
    );
  }
}

class AppliedJob extends StatefulWidget {
  final String jobId;
  AppliedJob(this.jobId);
  // const AppliedJob({ Key? key }) : super(key: key);

  @override
  _AppliedJobState createState() => _AppliedJobState();
}

class _AppliedJobState extends State<AppliedJob> {
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.dark,
      // colorSaturation: ColorSaturation.highSaturation,
      colorHue: ColorHue.multiple(colorHues: [
        ColorHue.red,
        ColorHue.blue,
        ColorHue.orange,
        ColorHue.pink
      ]),
    );

    final Color randomColor = _color;
    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('jobs').doc(widget.jobId).get(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 12.5.h,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final jobData = snapshot.data;
        print(jobData.toString());

        if (jobData == null) {
          return Text('error');
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.875.h),
          child: _Body(
            workingDays: jobData['workingDays'],
            workingHours: jobData['workingHours'],
            jobId: widget.jobId,
            jobName: jobData['jobName'],
            salary: jobData['salary'],
            specialRequest: jobData['specialRequest'],
            color: randomColor,
            shopId: jobData['shopId'],
          ),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  // const _Body({ Key? key }) : super(key: key);
  final String jobName;
  final String workingHours;
  final String jobId;
  final String salary;
  final String workingDays;
  final String specialRequest;
  final Color color;
  final String shopId;
  _Body({
    @required this.jobId,
    @required this.jobName,
    @required this.salary,
    @required this.workingHours,
    @required this.specialRequest,
    @required this.workingDays,
    this.color,
    @required this.shopId,
  });

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser.uid;
    Future<void> removeApplication() async {
      try {
        await FirebaseFirestore.instance
            .collection('jobs')
            .doc(widget.jobId)
            .collection('applicants')
            .doc(uid)
            .delete();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to remove from applicants!')),
        );
      }
      try {
        final userData = await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(uid)
            .get();
        List jobs = userData['appliedJobs'];
        jobs.remove(widget.jobId.toString());

        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(uid)
            .update({'appliedJobs': jobs});
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('failed to remove from employee profile!')),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
        // color: Colors.teal[50],
        border: Border.all(width: 3, color: widget.color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            // height: 100,
            child: Column(
              children: <Widget>[
                // job title and salary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          // horizontal: 10,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          widget.jobName,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 15.w,
                              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                              child: Text(
                                'Salary',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(2),
                              // width: 15.w,
                              // margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 2.5.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Rs ' + widget.salary,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // working hours
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 2.5.w,
                      right: 2.5.w,
                      top: 0,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    // width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30.w,
                          padding: EdgeInsets.only(left: 2.5.w, right: 3.75.w),
                          child: Text(
                            'Working Hours',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            // width: 200,
                            // margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 2.5.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Text(
                              widget.workingHours,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_expanded)
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 0,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      // width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // width: 120,
                            padding: EdgeInsets.only(left: 10, right: 15),
                            child: Text(
                              'Working Days',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(2),
                              // width: 200,
                              // margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Text(
                                widget.workingDays,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget.specialRequest != '' && _expanded)
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 0,
                      bottom: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: widget.color,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      widget.specialRequest,
                      textAlign: TextAlign.center,
                    ),
                  ),

                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Positioned.fill(
            bottom: -25,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                // width: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => JobDetailsScreen(
                                    isWithdrawing: true,
                                    jobId: widget.jobId,
                                    shopId: widget.shopId,
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: widget.color,
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: widget.color,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Are you sure? '),
                            content: Text(
                                'Do you want to withdraw your application?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  removeApplication();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('YES!'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('NO!'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: widget.color,
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Withdraw Application',
                          style: TextStyle(
                            color: widget.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -25,
            right: 20,
            child: IconButton(
              icon: CircleAvatar(
                radius: 18,
                backgroundColor: widget.color,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 22,
                    color: widget.color,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
