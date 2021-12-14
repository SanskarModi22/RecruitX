import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:helping_hand/Shared/loader.dart';

// import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/manage_shops_screen.dart';
import 'package:helping_hand/widgets/newshop.dart';
import 'package:helping_hand/widgets/reviews_forEmployer.dart';
// import 'package:provider/provider.dart';
import '../widgets/shop_refs.dart';

import '../widgets/newjob.dart';

// ignore: camel_case_types
class EmployerProfile extends StatefulWidget {
  final String uid;
  EmployerProfile(this.uid);
  @override
  _EmployerProfileState createState() => _EmployerProfileState();
}

// ignore: camel_case_types
class _EmployerProfileState extends State<EmployerProfile> {
  var x = 5;

  @override
  Widget build(BuildContext context) {
    // final user =
    //     Provider.of<GetUserInfo>(context).fetchAndSetUserinfoForEmployer;

    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('employerProfile')
          // .doc(widget.uid)
          .doc(widget.uid)
          .get(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> userSnapShot) {
        if (userSnapShot.connectionState == ConnectionState.waiting) {
          return ColorLoader3();
        }
        final userData = userSnapShot.data;
        final uId = FirebaseAuth.instance.currentUser.uid;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              // user.employerName,
              userData['name'],
              // "Employer",
              style: TextStyle(
                color: Colors.teal[600],
              ),
            ),
            actions: [
              // IconButton(
              //     icon: Icon(Icons.edit),
              //     onPressed: () {},
              //   ),
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
                  isMe: widget.uid == uId ? true : false,
                  // isMe: false,
                  profileImg: userData['employerImg'],
                  name: userData['name'],
                  age: userData['age'],
                  bio: userData['bio'],
                  dob: userData['dob'],
                  address: userData['address'],
                  contact: userData['contact'],

                  shopImg: userData['shopImg'],
                ),
                // shops
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.teal,
                          size: 30,
                        ),
                        title: Text('Shops'),
                        subtitle: Text('shops owned '),
                        trailing: widget.uid == uId
                            ? Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ManageShops(userData['name']),
                                            ),
                                          );
                                        }),
                                    IconButton(
                                      icon: Icon(Icons.add_business_sharp),
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
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: NewShop(userData['name']),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      ),
                      ShopRefs(widget.uid),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                // reviews
                ReviewsForEmployer(widget.uid),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UpperBody extends StatefulWidget {
  final bool isMe;
  final String name;
  final String dob;
  final String age;
  final String contact;

  final String bio;
  final String address;
  final String profileImg;
  final String shopImg;
  const _UpperBody({
    @required this.shopImg,
    @required this.profileImg,
    @required this.isMe,
    @required this.dob,
    @required this.name,
    @required this.age,
    @required this.contact,
    @required this.bio,
    @required this.address,
  });

  @override
  __UpperBodyState createState() => __UpperBodyState();
}

class __UpperBodyState extends State<_UpperBody> {
  var _expanded = false;

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
                    // background image
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.shopImg,
                            ),
                          )),
                    ),
                    // profile image
                    Positioned(
                      bottom: -50,
                      left: 10,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(
                            widget.profileImg,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name of employer
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
                                    initialRating: 4,
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
                        Row(
                          mainAxisAlignment: widget.isMe
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.end,
                          children: [
                            //  Post Job button
                            if (widget.isMe)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (ctx) => NewJob()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.plus,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
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
