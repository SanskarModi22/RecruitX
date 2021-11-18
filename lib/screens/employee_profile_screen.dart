import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/widgets/reviewsForEmployee.dart';
import 'package:provider/provider.dart';
import '../widgets/newReview.dart';

// ignore: camel_case_types
class EmployeeProfile extends StatefulWidget {
  final String uid;
  EmployeeProfile(this.uid);
  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

// ignore: camel_case_types
class _EmployeeProfileState extends State<EmployeeProfile> {
  var x = 5;
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    // final loadedUser =
    //     Provider.of<GetUserInfo>(context).fetchAndSetUserinfoForEmployee;
    // final reviews =
    //     Provider.of<GetUserInfo>(context).fetchAndSetReviewsForEmployee.reviews;
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(widget.uid)
          .get(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final user = snapshot.data;
        // final List<String> expectedJobs = user['expectedJobs'];
        String expectedJobs() {
          String _list = '';
          List<dynamic> jobs = user['expectedJobs'];
          jobs.forEach((element) {
            _list += element.toString() + ',  ';
          });
          return _list;
        }

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              user['name'],
              style: TextStyle(
                color: Colors.teal[600],
              ),
            ),
            actions: [
              // IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: () {},
              // ),
              // report from menu
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.report,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Report',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _UpperBody(
                  address: user['address'],
                  age: user['age'],
                  backImgUrl: user['backgroundImgUrl'],
                  bio: user['bio'],
                  contact: user['contact'],
                  dob: user['dob'],
                  name: user['name'],
                  profileImgUrl: user['img_url'],
                  rating: user['averageRating'],
                ),
                // currently working at
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.work,
                      color: Colors.teal,
                      size: 30,
                    ),
                    title: Text('Currently Working at '),
                    subtitle: Text(user['currentWork']),
                    // trailing: Icon(Icons.edit),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.chartLine,
                      size: 28,
                      color: Colors.teal,
                    ),
                    title: Text('Working Experience'),
                    subtitle: Text(user['experience']),
                    // trailing: Icon(Icons.edit),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // preference
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.room_preferences,
                          color: Colors.teal,
                          size: 30,
                        ),
                        title: Text('Preference'),
                        // subtitle: Text('Part-Time SalesBoy'),
                        // trailing: Icon(Icons.edit),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem('Job Type', user['jobType']),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem(
                              'Expected Salary',
                              'Rs ' +
                                  user['minExpSalary'].toString() +
                                  ' - ' +
                                  'Rs ' +
                                  user['maxExpSalary'].toString(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem('Job', expectedJobs()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child:
                                PreferenceItem('Shift', user['preferredShift']),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ReviewsForEmployee(widget.uid)
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UpperBody extends StatefulWidget {
  // const _UpperBody({ Key? key }) : super(key: key);
  final String name;
  final String contact;
  final String profileImgUrl;
  final String backImgUrl;
  final double rating;
  final String age;
  final String dob;
  final String bio;
  final String address;
  _UpperBody({
    @required this.address,
    @required this.age,
    @required this.backImgUrl,
    @required this.bio,
    @required this.contact,
    @required this.dob,
    @required this.name,
    @required this.profileImgUrl,
    @required this.rating,
  });

  @override
  __UpperBodyState createState() => __UpperBodyState();
}

class __UpperBodyState extends State<_UpperBody> {
  bool _expanded = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top of profile (Dp and BDP )
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.backImgUrl,
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: -50,
                      left: 10,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(
                            widget.profileImgUrl,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name of employee
                              Row(
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Icons.verified,
                                      size: 18,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                              // contact number
                              Text(
                                '+91 ' + widget.contact,
                                style: TextStyle(color: Colors.black),
                              ),
                              // average rating bar
                              Row(
                                children: [
                                  Text(
                                    'Rating: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    itemSize: 20,
                                    initialRating: widget.rating,
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 1.0, vertical: 0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (ctx) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // hire now button and more details button
                        // Row(
                        //   // mainAxisSize: MainAxisSize.min,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text('Details:'),
                        //     IconButton(
                        //       icon: Icon(
                        //         _expanded
                        //             ? Icons.expand_less
                        //             : Icons.expand_more,
                        //       ),
                        //       onPressed: () {
                        //         setState(() {
                        //           _expanded = !_expanded;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            // if clicked on more detail button. --- more details
            if (_expanded)
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // DOB and age
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Age
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: Colors.white,
                            border: Border.all(width: 2, color: Colors.teal),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Age:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  widget.age,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // D.O.B
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: Colors.teal[100],
                            border: Border.all(width: 2, color: Colors.teal),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'D.O.B:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  widget.dob,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Divider(),
                    // bio and address
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 5,
                        bottom: 5,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // color: Colors.teal[100],
                              border: Border.all(width: 2, color: Colors.teal),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Bio: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.bio),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // color: Colors.teal[100],
                              border: Border.all(width: 2, color: Colors.teal),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Address: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.address),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PreferenceItem extends StatelessWidget {
  final String que;
  final String ans;
  PreferenceItem(this.que, this.ans);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        // color: Colors.teal,
        color: Colors.teal,
      ),
      padding: EdgeInsets.all(2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              que,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal[100],
              ),
              child: Text(
                ans,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
