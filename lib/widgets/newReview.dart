import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewReview extends StatefulWidget {
  @override
  State<NewReview> createState() => _NewReviewState();
}

class _NewReviewState extends State<NewReview> {
  double _rating = 0.0;
  String _reviewPara = '';

  Future<void> addReview(String cuid, String ruid) async {
    // ruid = user id of employer who is being reviewed
    // cuid = user id of current user i.e who is reviewing
    final cUser = await FirebaseFirestore.instance
        .collection('employeeProfile')
        .doc(cuid)
        .get();
    await FirebaseFirestore.instance
        .collection('employerProfile')
        .doc(ruid)
        .collection('reviews')
        .add(
      {
        'jobWorked': 'xyz',
        'reviewerName': cUser['name'],
        'userProfileImgUrl': 'user profile image url',
        'backgroundImgUrl': 'background image url',
        'rating': _rating,
        'reviewPara': _reviewPara,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          child: Container(
            // height: 400,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 0),
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
                        horizontal: 30.0, vertical: 10),
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
                            color: Colors.teal,
                            border: Border.all(
                              color: Colors.teal,
                              // width:
                            )),
                        margin: EdgeInsets.only(top: 20, bottom: 0),
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
