import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helping_hand/Model/shop.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/job_details_screen.dart';
import 'package:provider/provider.dart';

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
    final loadedshop = Provider.of<GetUserInfo>(context)
        .fetchAndSetEmployerShops
        .shops
        .firstWhere((shopEx) => shopEx.shopid == providedShopId);
    final jobs = loadedshop.jobsAvailable;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedshop.shopName,
          style: TextStyle(color: Colors.teal),
        ),
        iconTheme: IconThemeData(
          color: Colors.teal,
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
                          image: NetworkImage(loadedshop.shopImageUrl),
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
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                loadedshop.shopType + ' Shop',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('Owner'),
                  subtitle: Text('Mellow Works'),
                  // trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(
                    Icons.adjust_outlined,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('Type of shop'),
                  subtitle: Text(loadedshop.shopType),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.work,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('No of employees hired '),
                  subtitle: Text(loadedshop.numOfEmployees),
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
                        color: Colors.teal,
                        size: 30,
                      ),

                      title: Text('Shop Address'),
                      // subtitle: Text('30'),
                      trailing: Icon(Icons.edit),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                          'Behind your house, in front of the pole, your ward, your city, your district, India'),
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
                        color: Colors.teal,
                        size: 30,
                      ),
                      title: Text('Jobs Available'),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: NewJob(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SingleChildScrollView(
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
                            id: jobs[i].jobId,
                            job: jobs[i].jobName,
                            salary: jobs[i].salary,
                            workDays: jobs[i].workingDays,
                            workHours: jobs[i].workingHours,
                            specialRequests: jobs[i].specialRequest,
                          ),
                        ),
                      ),
                    ),
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
  }
}

class JobAvailable extends StatefulWidget {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  JobAvailable({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });

  @override
  _JobAvailableState createState() => _JobAvailableState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _JobAvailableState extends State<JobAvailable> {
  final String job;
  final String id;

  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;

  _JobAvailableState({
    this.job,
    this.salary,
    this.workDays,
    this.workHours,
    this.specialRequests,
    this.id,
  });

  var _owner = true;
  @override
  Widget build(BuildContext context) {
    return (_owner)
        ? Dismissible(
            key: ValueKey(id),
            background: Container(
              color: Colors.teal[200],
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
            confirmDismiss: (direction) {
              // return Future.value(true);
              return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text('Are you sure? '),
                        content:
                            Text('Do you want to delete this job posting?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                            child: Text('YES!'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: Text('NO!'),
                          ),
                        ],
                      ));
            },
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            child: InsideBody(
              id: id,
              job: job,
              salary: salary,
              workDays: workDays,
              workHours: workHours,
              specialRequests: specialRequests,
            ),
          )
        : InsideBody(
            id: id,
            job: job,
            salary: salary,
            workDays: workDays,
            workHours: workHours,
            specialRequests: specialRequests,
          );
  }
}

class InsideBody extends StatefulWidget {
  // const InsideBody({ Key? key }) : super(key: key);
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  InsideBody({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  @override
  _InsideBodyState createState() => _InsideBodyState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _InsideBodyState extends State<InsideBody> {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  String specialRequests;
  _InsideBodyState({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  var _expanded = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3, color: Colors.teal),
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
                              color: Colors.teal,
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
                              job,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.teal,
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
                                    // color: Colors.teal[100],
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'Rs ' + salary,
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
                          color: Colors.teal,
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
                                  // color: Colors.teal[100],
                                  color: Colors.white,
                                ),
                                child: Text(
                                  workHours,
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
                            color: Colors.teal,
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
                                    // color: Colors.teal[100],
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    workDays,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (specialRequests != null && _expanded)
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          // color: Colors.teal[100],
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(specialRequests),
                      ),

                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned(
                left: 5,
                bottom: -10,
                child: TextButton(
                  child: Text('Details'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailsScreen(),
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                bottom: -25,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.teal[700],
                          width: 2,
                        ),
                        color: Colors.teal[50],
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Apply Now !',
                        style: TextStyle(
                          color: Colors.teal[800],
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
                    backgroundColor: Colors.teal,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.teal[50],
                      child: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                        size: 22,
                        color: Colors.teal,
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
          )
        ],
      ),
    );
  }
}
