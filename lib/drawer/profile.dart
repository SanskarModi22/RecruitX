import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(profile());
}

// ignore: camel_case_types
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  var x = 5;
  var _expanded = false;
  var _isemployee = true;
  var _isemployer = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Profile'),
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
              )
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
                                                'Mellow Works',
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
                                            'Contact: +91 8888888888',
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
                                                initialRating: 4,
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
                                        if (_isemployee)
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
                                        if (_isemployer)
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
                                                    child: Text('Post Job!'),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.teal[100],
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
                                              '25',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.teal[100],
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
                                              '05/11/2002',
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
                                          color: Colors.teal[100],
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
                                                    'I am a student, looking for a part-time job. Not available on weekends.'),
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
                                          color: Colors.teal[100],
                                          border: Border.all(
                                              width: 2, color: Colors.teal),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (_isemployee)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    'Address: ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              if (_isemployer)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    'Shop Address: ',
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
                                                    'Behind your house, in front of the pole, your ward, your city, your district, India'),
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
                if (_isemployee)
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
                      subtitle: Text('Raju Bhaiya Mithai Shop'),
                      trailing: Icon(Icons.edit),
                    ),
                  ),
                if (_isemployer)
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
                      title: Text('No of employees hired '),
                      subtitle: Text('30'),
                      trailing: Icon(Icons.edit),
                    ),
                  ),
                SizedBox(
                  height: 8,
                ),
                // experience
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.chartLine,
                      size: 28,
                      color: Colors.teal,
                    ),
                    title: Text('Experience'),
                    subtitle: Text('5 months'),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // preferences
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
                            child: PreferenceItem('Job Type', 'Part-Time'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child:
                                PreferenceItem('Expected Salary', 'min: 15k'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem('Job',
                                'Waiter, Private Tutor, Dishwasher, Watchmen, Security Guard'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: PreferenceItem('Shift', 'Night Hours'),
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
                                  return NewReview();
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
                            ReviewItem(
                              givenrating: 3.5,
                              shopname: 'Mera Yasu Fanclub',
                              shoppicurl:
                                  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bojnice-castle-1603142898.jpg',
                              workedas: 'Errand Boy',
                              reviewdescription:
                                  'He worked great, i can assure you that he can get the job done even if its not legal.',
                            ),
                            ReviewItem(
                              givenrating: 4.5,
                              shopname: 'Macho Underwears',
                              shoppicurl:
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

class ReviewItem extends StatelessWidget {
  final String shopname;
  final double givenrating;
  final String reviewdescription;
  final String shoppicurl;
  final String workedas;
  ReviewItem(
      {this.givenrating,
      this.reviewdescription,
      this.shopname,
      this.shoppicurl,
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
                  image: NetworkImage(shoppicurl),
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
                      color: Colors.teal,
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
                      color: Colors.teal[100],
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

class NewReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: 400,
        color: Colors.teal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: Colors.teal[100],
                margin: EdgeInsets.only(top: 20, bottom: 0),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Write a Review',
                  style: TextStyle(color: Colors.teal[900], fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: RatingBar.builder(
                  itemSize: 40,
                  initialRating: 0,
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
                color: Colors.teal[200],
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: TextFormField(
                  maxLines: 5,
                  maxLength: 150,
                  decoration: InputDecoration(
                    labelText: 'Decribe your Experience',
                    labelStyle: TextStyle(color: Colors.teal[900]),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal[100],
                    ),
                    margin: EdgeInsets.only(top: 20, bottom: 0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.teal[900],
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
