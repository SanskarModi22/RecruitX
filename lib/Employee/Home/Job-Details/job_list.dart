import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_detail.dart';
import 'package:helping_hand/Employee/Home/employee_filter_button.dart';
import 'package:helping_hand/Employee/Home/employee_searchBar.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class JobList extends StatefulWidget {
  const JobList({Key key, this.text}) : super(key: key);

  @override
  _JobListState createState() => _JobListState();
  final String text;
}

class _JobListState extends State<JobList> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  bool isTapped;
  bool isExpanded;
  TextEditingController _searchController;

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  bool isExpand = false;
  @override
  StreamSubscription subscription;
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen(showConnectivityResult);
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
    // final user = Provider.of<MyUser>(context);
    var data = await FirebaseFirestore.instance
        .collection('jobs')
        .where("jobName", isEqualTo: widget.text)
        .get();
    setState(() {
      _allResults = data.docs;
      print(_allResults);
      print(widget.text);
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Color(0xffF57752),
          brightness: Brightness.dark,
          elevation: 0,
          titleSpacing: 7.w,
          title: Row(
            children: [
              toggle == 0
                  ? Text(
                      '${widget.text}',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  : Container(),
              SizedBox(
                width: 3.w,
              )
            ],
          ),
          centerTitle: true,
          actions: [
            EmployeeSearchBar(
              textEditingController: _searchController,
            ),
            EmployeeFilterButton(
              height: 3.h,
              margin: 8.5,
            )
          ],
        ),
        body: _resultsList.length > 0
            ? Stack(
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
                              double _w = MediaQuery.of(context).size.width;
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
                                          itemCount: _resultsList.length,
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
                                                  result: _resultsList[index],
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
            : Center(
                child: Text(
                  "Sorry No jobs Availaible",
                ),
              ));
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
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var fetchAndSetEmployerShops2 =
        context.watch<GetUserInfo>().fetchAndSetEmployerShops;
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
            height: isTapped ? 12.h : 35.h,
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
                    blurRadius: 15.3.sp,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16.15.sp,
                              backgroundImage:
                                  NetworkImage(widget.result["shopImgUrl"]),
                            ),
                            SizedBox(
                              width: 6.25.w,
                            ),
                            Text(
                              widget.result["shopName"],
                              style: TextStyle(
                                  fontSize: 16.15.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 6.25.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  "City",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.result["city"] ?? "Null"),
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.result["shopName"],
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "City - ",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.result["city"] ?? "Null",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 20.sp,
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
                              tag: widget.result["shopImgUrl"],
                              child: CircleAvatar(
                                radius: 57.sp,
                                backgroundImage:
                                    NetworkImage(widget.result["shopImgUrl"]),
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
                                  "Shop Owner",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.result["ownerName"],
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
                                Text(widget.result["workingHours"]),
                                SizedBox(
                                  height: 1.25.h,
                                ),
                                Text(
                                  "Salary offered",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.result["salary"]),
                                SizedBox(
                                  height: 1.25.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.75.w, 0.5.h, 0, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                JobDetailsScreen(
                                              isWithdrawing: false,
                                              jobId: widget.result.id,
                                              shopId: widget.result['shopId'],
                                            ),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)))),
                                      child: Text(
                                        "More details",
                                        style:
                                            TextStyle(color: Colors.green[900]),
                                      )),
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
