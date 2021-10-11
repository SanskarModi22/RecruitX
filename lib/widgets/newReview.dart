import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    onRatingUpdate: (ctx) {},
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
    );
  }
}
