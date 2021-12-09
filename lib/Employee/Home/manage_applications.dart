import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_detail.dart';
import 'package:helping_hand/Employee/Home/employee_filter_button.dart';
import 'package:helping_hand/Employee/Home/employee_searchBar.dart';
import 'package:helping_hand/api/notification_api.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class JobApplication extends StatefulWidget {
  const JobApplication({Key key, this.text}) : super(key: key);

  @override
  _JobApplicationState createState() => _JobApplicationState();
  final String text;
}

class _JobApplicationState extends State<JobApplication> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  bool isTapped;
  bool isExpanded;
  TextEditingController _searchController;

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  List _tempResult=[];
  bool isExpand = false;
  @override
  StreamSubscription subscription;
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivityResult);
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

// Be sure to cancel subscription after you are done

  void showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    final message =
    hasInternet ? 'You are connected to Network' : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _controller.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var tripSnapshot in _allResults) {
        var shopName = tripSnapshot["shopName"].toString().toLowerCase();
        var jobName = tripSnapshot["jobName"].toString().toLowerCase();

        if (shopName.contains(_searchController.text.toLowerCase()) &&
            jobName.contains(widget.text.toLowerCase())) {
          showResults.add(tripSnapshot);
          setState(() {
            isExpanded = true;
          });
        }
      }
    } else {
      showResults = List.from(_allResults);
      setState(() {
        isExpanded = false;
      });
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    final user = FirebaseAuth.instance.currentUser.uid;
    final userData = await FirebaseFirestore.instance
        .collection('employeeProfile')
        .doc(user)
        .get();
    final maxSal = userData['maxExpSalary'];
    final minSal = userData['minExpSalary'];
    final bool nightShift =
    userData['preferredShift'] == 'Night Shift' ? true : false;
    final bool partTime = userData['jobType'] == 'Part-Time' ? true : false;
    final List cities = userData['preferredCities'];
    // print(cities);

    var data = await FirebaseFirestore.instance
        .collection('jobs')
        .where("jobName", isEqualTo: widget.text)
        .where('salary', isGreaterThanOrEqualTo: minSal)
        .where('salary', isLessThanOrEqualTo: maxSal)
        .where('city', whereIn: cities)
        .where('partTime', isEqualTo: partTime)
        .where('nightShift', isEqualTo: nightShift)
        .get();
    var temp= await FirebaseFirestore.instance
        .collection('jobs')
        .where("jobName", isEqualTo: widget.text)
        .get();
    setState(() {
      _allResults = data.docs;
      _tempResult=temp.docs;
      print(_allResults);
      print(widget.text);
    });
    searchResultsList();
    return "complete";
  }

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
      if (appliedJobs == null || appliedJobs.isEmpty) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Manage Applications'),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/waiting.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Applications Found !',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ));
      }
      return Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          appBar: AppBar(
            backgroundColor: Color(0xffF57752),
            brightness: Brightness.dark,
            elevation: 0,
            titleSpacing: 7.w,
            title: Text(
              'Manage Applications',
              style: TextStyle(
                // fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            centerTitle: true,
            // actions: [
            //   EmployeeSearchBar(
            //     textEditingController: _searchController,
            //   ),
            //   EmployeeFilterButton(
            //     height: 3.h,
            //     margin: 8.5,
            //   )
            // ],
          ),
          body:
          Stack(
            children: [
              ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    height: 100.h,
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, item) {
                          double _w = MediaQuery
                              .of(context)
                              .size
                              .width;
                          return Opacity(
                            opacity: _animation.value,
                            child: Transform.translate(
                              offset: Offset(0, _animation2.value),
                              child: InkWell(
                                enableFeedback: true,
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => RouteWhereYouGo(),
                                  //     ));

                                  setState(() {
                                    isTapped = !isTapped;
                                  });
                                },
                                onHighlightChanged: (value) {
                                  setState(() {
                                    isExpanded = value;
                                  });
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Container(
                                  height: 100.h,
                                  child: AnimationLimiter(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.all(_w / 30),
                                      physics: BouncingScrollPhysics(
                                          parent:
                                          AlwaysScrollableScrollPhysics()),
                                      itemCount: appliedJobs.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          delay:
                                          Duration(milliseconds: 100),
                                          child: SlideAnimation(
                                            duration: Duration(
                                                milliseconds: 2500),
                                            curve: Curves
                                                .fastLinearToSlowEaseIn,
                                            horizontalOffset: -300,
                                            verticalOffset: -850,
                                            child: ExpandedDetails(
                                              index: index,
                                              result: appliedJobs[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              CustomPaint(
                painter: MyPainter(),
                child: Container(height: 0),
              ),
            ],
          )
          //     : Center(
          //     child: _tempResult.length == 0 ? Text(
          //       "Sorry No jobs Availaible",
          //     ) : Text("Please Apply correct filters")
          // )
      );
    });
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Color(0xffF57752)
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Color(0xffF57752)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ExpandedDetails extends StatefulWidget {
  final int index;
  final result;
  const ExpandedDetails({Key key, this.index, this.result}) : super(key: key);
  @override
  _ExpandedDetailsState createState() => _ExpandedDetailsState();
}

class _ExpandedDetailsState extends State<ExpandedDetails> {


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future:
        FirebaseFirestore.instance.collection('jobs').doc(widget.result).get(),
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
      return Details(
        workingDays: jobData['workingDays'],
        workingHours: jobData['workingHours'],
        jobId: widget.result,
        jobName: jobData['jobName'],
        salary: jobData['salary'].toString(),
        specialRequest: jobData['specialRequest'],
        shopId: jobData['shopId'],
        shopName: jobData['shopName'],
        shopImgUrl: jobData['shopImgUrl'],
        city:jobData['city'],
      );
    });
  }
}
class Details extends StatefulWidget {
  const Details({Key key, this.jobName, this.workingHours, this.jobId, this.salary, this.workingDays, this.specialRequest, this.color, this.shopId, this.shopName, this.shopImgUrl, this.city}) : super(key: key);
  final String jobName;
  final String workingHours;
  final String jobId;
  final String salary;
  final String workingDays;
  final String specialRequest;
  final Color color;
  final String shopId;
  final String shopName;
  final String shopImgUrl;
  final String city;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
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
      ScaffoldMessenger.of(context).clearSnackBars();
      DocumentSnapshot data = await FirebaseFirestore.instance
          .collection('jobs')
          .doc(widget.jobId)
          .get();
      // sendSms(userData['contact'], data['shopName'], data['jobName']);
      NotificationApi.showNotification(
        title: 'Job Update',
        body:
        'You have successfully removed your application of id ${data.id}.',
        payload: userData['contact'],
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully removed Your application!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('failed to remove from employee profile!')),
      );
    }
  }
  bool isTapped = true;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {


      return Column(
        children: [
          SizedBox(
            height: 3.75.h,
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            onHighlightChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            child: Container(
              height: isTapped ? 14.h : 36.h,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                // height: isTapped
                //     ? isExpanded
                //         ? 65
                //         : 70
                //     : isExpanded
                //         ? 225
                //         : 230,
                // width: isExpanded ? 385 : 390,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 253, 208, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6F12E8).withOpacity(0.5),
                      blurRadius: 4.9.w,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(4.w),
                child: isTapped
                    ? FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5.2.w,
                            backgroundImage:
                            NetworkImage(widget.shopImgUrl),
                          ),
                          SizedBox(
                            width: 6.25.w,
                          ),
                          Container(
                            // width: 30.w,
                            child: FittedBox(
                              child: Text(
                                widget.shopName,
                                style: TextStyle(
                                    fontSize: 4.w,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            children: [
                              Text(
                                "Job",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.jobName ?? "Null"),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Icon(
                            isTapped
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.black,
                            size: 6.5.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          child: FittedBox(
                            child: Text(
                              widget.shopName,
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 5.5.w,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  "City - ",
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 4.5.w,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.city ?? "Null",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 4.5.w),
                                ),
                                Icon(
                                  isTapped
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Colors.black,
                                  size: 6.5.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.shopImgUrl,
                          child: CircleAvatar(
                            radius: 18.5.w,
                            backgroundImage:
                            NetworkImage(widget.shopImgUrl),
                          ),
                        ),
                        SizedBox(
                          width: 7.5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Working Days",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.workingDays,
                            ),
                            SizedBox(
                              height: 1.25.h,
                            ),
                            Text(
                              "Working Hours",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(widget.workingHours),
                            SizedBox(
                              height: 1.25.h,
                            ),
                            Text(
                              "Salary offered",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(widget.salary),
                            SizedBox(
                              height: 1.25.h,
                            ),
                            Container(
                              width: 40.w,
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  JobDetailsScreen(
                                                    jobId: widget.jobId,
                                                    shopId: widget.shopId,
                                                  ),
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.greenAccent),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20)))),
                                        child: Text(
                                          "More details",
                                          style:
                                          TextStyle(color: Colors.white),
                                        )),
                                    ElevatedButton(
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
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20)))),
                                        child: Text(
                                          "Withdraw",
                                          style:
                                          TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // Text(
                    //   isTapped
                    //       ? ''
                    //       : 'Widgets that have global keys reparent '
                    //           'their subtrees when they are moved from one '
                    //           'location in the tree to another location in '
                    //           'the tree. In order to reparent its subtree, '
                    //           'a widget must arrive at its new location in '
                    //           'the tree in the same animation frame in '
                    //           'which it was removed from its old location '
                    //           'the tree.',
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.9),
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

