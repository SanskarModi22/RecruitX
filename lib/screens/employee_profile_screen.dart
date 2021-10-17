import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/provider.dart';
import '../widgets/newReview.dart';

// ignore: camel_case_types
class EmployeeProfile extends StatefulWidget {
  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

// ignore: camel_case_types
class _EmployeeProfileState extends State<EmployeeProfile> {
  var x = 5;
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final loadedUser =
        Provider.of<GetUserInfo>(context).fetchAndSetUserinfoForEmployee;

    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              loadedUser.employeeName,
              style: TextStyle(
                color: Colors.teal[600],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
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
                Card(
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
                                          'https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg',
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
                                        'https://i.pinimg.com/originals/9a/25/d8/9a25d86d090fc965a7f9c0ad25668b10.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name of employee
                                          Row(
                                            children: [
                                              Text(
                                                loadedUser.employeeName,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                            loadedUser.employeeContactNumber,
                                            style:
                                                TextStyle(color: Colors.black),
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
                                                initialRating:
                                                    loadedUser.averageRating,
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 1.0,
                                                        vertical: 0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // hire now button

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text('Hire Now!'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        // more details
                                        Row(
                                          children: [
                                            Text('Details:'),
                                            IconButton(
                                              icon: Icon(
                                                _expanded
                                                    ? Icons.expand_less
                                                    : Icons.expand_more,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _expanded = !_expanded;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // if clicked on more detail button. --- more details
                        if (_expanded)
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // DOB and age
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // Age
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        // color: Colors.white,
                                        border: Border.all(
                                            width: 2, color: Colors.teal),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Age:',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              loadedUser.employeeAge,
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
                                        border: Border.all(
                                            width: 2, color: Colors.teal),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'D.O.B:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              loadedUser.employeeDOB,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          // color: Colors.teal[100],
                                          border: Border.all(
                                              width: 2, color: Colors.teal),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  'Bio: ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    loadedUser.employeeBio),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          // color: Colors.teal[100],
                                          border: Border.all(
                                              width: 2, color: Colors.teal),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  'Address: ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    loadedUser.employeeAddress),
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
                    subtitle: Text(loadedUser.currentlyWorkingAt),
                    trailing: Icon(Icons.edit),
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
                    subtitle: Text(loadedUser.employeeExperience),
                    trailing: Icon(Icons.edit),
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
                        trailing: Icon(Icons.edit),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem(
                                'Job Type', loadedUser.preferredJobType),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem('Expected Salary',
                                'Rs ' + loadedUser.employeeExpectedSalary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem(
                                'Job', loadedUser.employeeExpectedJobs),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem(
                                'Shift', loadedUser.employeePreferedShift),
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
                // reviews

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.chartLine,
                          size: 28,
                          color: Colors.teal,
                        ),
                        title: Text('Reviews'),
                        trailing: IconButton(
                            icon: Icon(Icons.add_comment),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: NewReview(),
                                  );
                                },
                              );
                            }),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            EmployeeReviewItem(
                              givenrating: 3.5,
                              shopname: 'Mera Yasu Fanclub',
                              shopImgUrl:
                                  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bojnice-castle-1603142898.jpg',
                              workedas: 'Errand Boy',
                              reviewdescription:
                                  'He worked great, i can assure you that he can get the job done even if its not legal.',
                            ),
                            EmployeeReviewItem(
                              givenrating: 4.5,
                              shopname: 'Macho Underwears',
                              shopImgUrl:
                                  'https://assets1.progressivegrocer.com/files/styles/content_sm/s3/2020-01/Stop%20%26%20Shop%20MASS.jpg?itok=PzykErKN',
                              workedas: 'Worker',
                              reviewdescription:
                                  'He worked great, i can assure you that he can get the job done even if its not legal. and so much more. asdas asdsad asda sdsad sd aas dasd sd asd asd asd asd as as da as  ',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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

class EmployeeReviewItem extends StatelessWidget {
  final String shopname;
  final double givenrating;
  final String reviewdescription;
  final String shopImgUrl;
  final String workedas;
  EmployeeReviewItem(
      {this.givenrating,
      this.reviewdescription,
      this.shopname,
      this.shopImgUrl,
      this.workedas});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      margin: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage(shopImgUrl),
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.teal.withOpacity(0.8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          shopname,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        workedas,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    ignoreGestures: true,
                    itemSize: 30,
                    initialRating: givenrating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (ctx) {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  height: 150,
                  // color: Color.fromRGBO(248, 239, 206, 1),
                  decoration: BoxDecoration(
                      // color: Colors.teal[100],
                      border: Border.all(width: 2, color: Colors.teal),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 30, bottom: 10),
                          child: Text(
                            'Client Review',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Divider(),
                        Container(
                          // height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            reviewdescription,
                            style: TextStyle(
                              fontSize: 15,

                              // fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
