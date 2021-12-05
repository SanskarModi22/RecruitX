import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ManagePost extends StatefulWidget {
  // const ManagePost({ Key? key }) : super(key: key);

  @override
  _ManagePostState createState() => _ManagePostState();
}

class _ManagePostState extends State<ManagePost> {
  @override
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('shops')
          .where('ownerId', isEqualTo: cUser)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
        final shops = snapshot.data.docs;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            title: Text(
              'Manage your posts',
              style: TextStyle(color: Colors.teal),
            ),
            backgroundColor: Colors.white,
          ),
          body: shops.isEmpty
              ? Center(
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
                        'No Posts Found !',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: shops.length,
                    itemBuilder: (ctx, i) => ShopPostItem(
                      shopId: shops[i].id,
                      shopImgUrl: shops[i]['shopImgUrl'],
                      shopName: shops[i]['shopName'],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
// employee

//employer
class ShopPostItem extends StatefulWidget {
  // const ShopPostItem({ Key? key }) : super(key: key);
  final String shopId;
  final String shopImgUrl;
  final String shopName;
  ShopPostItem(
      {@required this.shopId,
      @required this.shopImgUrl,
      @required this.shopName});
  @override
  _ShopPostItemState createState() => _ShopPostItemState();
}

class _ShopPostItemState extends State<ShopPostItem> {
  var _isexpanded = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('jobs')
            .where('shopId', isEqualTo: widget.shopId)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final jobs = snapshot.data.docs;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Card(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: NetworkImage(widget.shopImgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        jobs.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(widget.shopName),
                    subtitle: Text('Jobs posted for this Shop.'),
                    trailing: IconButton(
                      iconSize: 35,
                      color: Colors.teal,
                      icon: Icon(
                        _isexpanded ? Icons.expand_less : Icons.expand_more,
                      ),
                      onPressed: () {
                        setState(() {
                          _isexpanded = !_isexpanded;
                        });
                      },
                    ),
                  ),
                  if (_isexpanded)
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      height: jobs.length == 1
                          ? 210
                          : min(jobs.length.toDouble() * 170, 400),
                      child: jobs.length != 0
                          ? ListView.builder(
                              itemCount: jobs.length,
                              itemBuilder: (ctx, i) => AvailableJobItem(
                                shopId: widget.shopId,
                                jobId: jobs[i].id,
                                jobName: jobs[i]['jobName'],
                                salary: jobs[i]['salary'].toString(),
                                workingDays: jobs[i]['workingDays'],
                                specialRequest: jobs[i]['specialRequest'],
                                workingHours: jobs[i]['workingHours'],
                              ),
                            )
                          : Container(
                              height: 100,
                              child: Text('No Job Posted'),
                            ),
                    )
                ],
              ),
            ),
          );
        });
  }
}

class AvailableJobItem extends StatefulWidget {
  final String jobId;
  final String shopId;
  final String jobName;
  final String salary;
  final String workingDays;
  final String workingHours;
  final String specialRequest;
  AvailableJobItem({
    @required this.shopId,
    @required this.jobId,
    @required this.jobName,
    @required this.salary,
    @required this.specialRequest,
    @required this.workingDays,
    @required this.workingHours,
  });

  @override
  _AvailableJobItemState createState() => _AvailableJobItemState();
}

class _AvailableJobItemState extends State<AvailableJobItem> {
  _AvailableJobItemState();

  var _owner = true;
  @override
  Widget build(BuildContext context) {
    void deleteJob() {
      FirebaseFirestore.instance
          .collection('jobs')
          .doc(widget.jobId)
          .delete()
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Job Deleted'),
          ),
        );
      });
    }

    return (_owner)
        ? Dismissible(
            key: ValueKey(widget.jobId),
            background: Container(
              color: Colors.orange,
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
                              deleteJob();
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
                      ));
            },
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            child: InsideBody(
              id: widget.jobId,
              job: widget.jobName,
              salary: widget.salary,
              workDays: widget.workingDays,
              workHours: widget.workingHours,
              specialRequests: widget.specialRequest,
            ),
          )
        : InsideBody(
            id: widget.jobId,
            job: widget.jobName,
            salary: widget.salary,
            workDays: widget.workingDays,
            workHours: widget.workingHours,
            specialRequests: widget.specialRequest,
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
    void deleteJob() {
      FirebaseFirestore.instance
          .collection('jobs')
          .doc(widget.id)
          .delete()
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Job Deleted'),
          ),
        );
      });
    }

    final Color random_color = Colors.orange[800];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // color: Colors.teal[50],
        border: Border.all(width: 3, color: random_color),
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
                          color: random_color,
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
                          color: random_color,
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
                      color: random_color,
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
                        color: random_color,
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
                                workDays,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (specialRequests != '' && _expanded)
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
                        color: random_color,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      specialRequests,
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
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Are you sure? '),
                        content:
                            Text('Do you want to delete this job posting?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              deleteJob();
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
                        color: random_color,
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: random_color,
                      ),
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
                backgroundColor: random_color,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 22,
                    color: random_color,
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
