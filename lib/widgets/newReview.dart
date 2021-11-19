import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewReview extends StatefulWidget {
  final String rUid;
  final bool isEmployee;
  final bool isEmployer;
  NewReview(this.rUid, {this.isEmployee, this.isEmployer});
  @override
  State<NewReview> createState() => _NewReviewState();
}

class _NewReviewState extends State<NewReview> {
  double _rating = 3.0;
  var _reviewPara = '';
  var _workedAs = '';
  final workedAsCtrl = TextEditingController();
  final reviewParaCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> addReviewForEmployee(String cuid, String ruid) async {
    // ruid = user id of employer who is being reviewed
    // cuid = user id of current user i.e who is reviewing
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid == true) {
      _formKey.currentState.save();
      final cUser = await FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(cuid)
          .get();
      try {
        await FirebaseFirestore.instance.collection('employeeReviews').add(
          {
            // change fields
            'reviewedId': ruid,
            'reviewerId': cuid,
            'workedAs': _workedAs,
            'shopName': 'Some Shop',

            'shopImgUrl':
                'https://www.texascooppower.com/content/detail_heart-to-heart-2-main.jpg',
            'rating': _rating,
            'reviewPara': _reviewPara,
          },
        ).then((value) => () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You reviewed successfully.')),
              );
              Navigator.of(context).pop();
            });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
      Navigator.of(context).pop();
    }
  }

  Future<void> addReviewForEmployer(String cuid, String ruid) async {
    // ruid = user id of employer who is being reviewed
    // cuid = user id of current user i.e who is reviewing
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid == true) {
      _formKey.currentState.save();

      final cUser = await FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(cuid)
          .get();
      try {
        await FirebaseFirestore.instance.collection('employerReviews').add(
          {
            // change fields
            'reviewedId': ruid,
            'reviewerId': cuid,
            'jobWorked': _workedAs,
            'reviewerName': 'random person',
            'userProfileImgUrl':
                'https://i1.sndcdn.com/avatars-000655118672-xb0aun-t500x500.jpg',
            'backgroundImgUrl':
                'https://media.proprofs.com/images/QM/user_images/2503852/New%20Project%20(81)(127).jpg',
            'rating': _rating,
            'reviewPara': _reviewPara,
          },
        ).then((value) => () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You rated successfully.')),
              );
              Navigator.of(context).pop();
            });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cUid = FirebaseAuth.instance.currentUser.uid;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            // height: 400,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.teal,
                        )),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Write a Review',
                      style: TextStyle(color: Colors.teal[900], fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RatingBar.builder(
                      itemSize: 40,
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: 1.0, vertical: 0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (value) {
                        setState(() {
                          _rating = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.teal[100],
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        )),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: TextFormField(
                      controller: workedAsCtrl,
                      onSaved: (val) {
                        setState(() {
                          _workedAs = val;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return '*required';
                        }
                        return null;
                      },
                      // maxLines: 5,
                      // maxLength: 150,
                      decoration: InputDecoration(
                        labelText: 'Worked As',
                        labelStyle: TextStyle(color: Colors.teal[900]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.teal[100],
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        )),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: TextFormField(
                      controller: reviewParaCtrl,
                      onSaved: (val) {
                        setState(() {
                          _reviewPara = val;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some review';
                        }
                        return null;
                      },
                      maxLines: 5,
                      maxLength: 150,
                      decoration: InputDecoration(
                        labelText: 'Decribe your Experience',
                        labelStyle: TextStyle(color: Colors.teal[900]),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (widget.isEmployer == true) {
                        addReviewForEmployer(cUid, widget.rUid);
                      }
                      if (widget.isEmployee == true) {
                        addReviewForEmployee(cUid, widget.rUid);
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal,
                            border: Border.all(
                              color: Colors.teal,
                              // width:
                            )),
                        // margin: EdgeInsets.only(top: 20, bottom: 0),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            // color: Colors.teal[900],
                            color: Colors.white,
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
        ),
      ),
    );
  }
}
