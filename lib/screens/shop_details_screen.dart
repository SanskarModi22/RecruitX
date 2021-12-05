import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_detail.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/employee_profile_screen.dart';
import 'package:helping_hand/screens/employer_profile_screen.dart';
// import 'package:helping_hand/screens/job_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

import '../widgets/newjob.dart';

class ShopDetailsScreen extends StatefulWidget {
  // const ShopDetailsScreen({ Key? key }) : super(key: key);
  final String providedShopId;

  ShopDetailsScreen({
    @required this.providedShopId,
  });
  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState(
        providedShopId: providedShopId,
      );
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  final String providedShopId;

  _ShopDetailsScreenState({
    this.providedShopId,
  });
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
        future: FirebaseFirestore.instance
            .collection('shops')
            .doc(widget.providedShopId)
            .get(),
        builder: (ctx,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                shopSnapshot) {
          if (shopSnapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: 140, child: Center(child: CircularProgressIndicator()));
          }
          final shopData = shopSnapshot.data;
          if (shopData == null) {
            return Container();
          }
          final cUser = FirebaseAuth.instance.currentUser.uid;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                shopData['shopName'],
                style: TextStyle(
                  color: randomColor,
                ),
              ),
              iconTheme: IconThemeData(
                color: randomColor,
              ),
              backgroundColor: Colors.white,
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Container(
                        height: 220,
                        child: Stack(
                          children: [
                            Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Image(
                                image: NetworkImage(shopData['shopImgUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 12,
                                ),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.redAccent,

                                  color: randomColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8)),
                                ),
                                child: FittedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.flag,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        shopData['shopType'],
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.insert_drive_file_rounded,
                              // color: Colors.deepOrangeAccent,
                              color: randomColor,
                              size: 30,
                            ),

                            title: Text('Shop Description'),
                            // subtitle: Text('30'),
                            trailing: Icon(Icons.edit),
                          ),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                // color: random_color600],
                                // color: Colors.deepOrangeAccent,
                                color: randomColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(shopData['shopDesc']),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          color: randomColor,
                          size: 30,
                        ),
                        title: Text('Owner'),
                        subtitle: Text(shopData['ownerName']),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.open_in_new_rounded,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    EmployerProfile(shopData['ownerId']),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          Icons.adjust_outlined,
                          // color: Colors.deepOrangeAccent,
                          color: randomColor,
                          size: 30,
                        ),
                        title: Text('Type of shop'),
                        subtitle: Text(shopData['shopType']),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.place_rounded,
                              // color: Colors.deepOrangeAccent,
                              color: randomColor,
                              size: 30,
                            ),

                            title: Text('Shop Address'),
                            // subtitle: Text('30'),
                            trailing: Icon(Icons.edit),
                          ),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                // color: random_color600],
                                // color: Colors.deepOrangeAccent,
                                color: randomColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(shopData['shopAddress']),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.work_outline_rounded,
                              // color: Colors.deepOrangeAccent,
                              color: randomColor,
                              // color: random_color
                              size: 30,
                            ),
                            title: Text('Jobs Available'),
                            trailing: shopData['ownerId'] == cUser
                                ? IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => NewJob()),
                                      );
                                    },
                                  )
                                : null,
                          ),
                          Jobs(widget.providedShopId, randomColor),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class Jobs extends StatefulWidget {
  // const Jobs({ Key? key }) : super(key: key);
  final String shopId;
  Color random_color;
  Jobs(this.shopId, this.random_color);
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    // print(widget.shopId);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('jobs')
            .where('shopId', isEqualTo: widget.shopId)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.data.docs == null) {
            return Container(
              child: Center(
                child: Text('NO Jobs Posted'),
              ),
            );
          }
          print(widget.shopId);
          final jobs = snapshot.data.docs;

          return SingleChildScrollView(
            child: Container(
              height: min(jobs.length.toDouble() * 160, 500),
              padding: EdgeInsets.only(
                top: 0,
                bottom: 10,
                right: 5,
                left: 5,
              ),
              child: ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: jobs.length,
                itemBuilder: (ctx, i) => JobAvailable(
                  providedShopId: widget.shopId,
                  jobId: jobs[i].id,
                  job: jobs[i]['jobName'],
                  salary: jobs[i]['salary'].toString(),
                  workDays: jobs[i]['workingDays'],
                  workHours: jobs[i]['workingHours'],
                  specialRequests: jobs[i]['specialRequest'],
                  randomColor: widget.random_color,
                ),
              ),
            ),
          );
        });
  }
}

class JobAvailable extends StatefulWidget {
  final Color randomColor;
  final String jobId;
  final String providedShopId;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;

  JobAvailable({
    this.providedShopId,
    this.randomColor,
    @required this.jobId,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });

  @override
  _JobAvailableState createState() => _JobAvailableState();
}

class _JobAvailableState extends State<JobAvailable> {
  _JobAvailableState();

  // var _owner = true;
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    Color randomColor = widget.randomColor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3,
          color: randomColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Stack(
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
                              color: randomColor,
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
                              widget.job,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: randomColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            // width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Salary',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(2),
                                  width: 100,
                                  // margin: EdgeInsets.symmetric(vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: random_color100],
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
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: randomColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              padding: EdgeInsets.only(left: 10, right: 15),
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
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color: random_color100],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  widget.workHours,
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
                            color: randomColor,
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
                                    // color: random_color100],
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    widget.workDays,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (widget.specialRequests != '' && _expanded)
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          // color: random_color100],
                          color: Colors.white,
                          border: Border.all(width: 2, color: randomColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(widget.specialRequests),
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
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => JobDetailsScreen(
                            jobId: widget.jobId,
                            shopId: widget.providedShopId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: randomColor,
                          width: 2,
                        ),
                        color: randomColor,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'More Details',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
                    backgroundColor: randomColor,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: randomColor,
                      child: Icon(
                          _expanded ? Icons.expand_less : Icons.expand_more,
                          size: 22,
                          color: Colors.white),
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
          )
        ],
      ),
    );
  }
}
