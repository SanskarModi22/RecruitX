import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/widgets/newReviewForEmployee.dart';
import 'package:helping_hand/widgets/newReviewForEmployer.dart';

class ReviewsForEmployee extends StatefulWidget {
  // const ReviewsForEmployee({ Key? key }) : super(key: key);
  final String ruid;
  ReviewsForEmployee(this.ruid);
  @override
  _ReviewsForEmployeeState createState() => _ReviewsForEmployeeState();
}

class _ReviewsForEmployeeState extends State<ReviewsForEmployee> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('employeeReviews')
            .where('reviewedId', isEqualTo: widget.ruid)
            .snapshots(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final reviews = snapshot.data.docs;
          final cUid = FirebaseAuth.instance.currentUser.uid;
          print(snapshot.data);
          print(reviews.isEmpty);
          return Card(
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
                  trailing: cUid != widget.ruid
                      ? IconButton(
                          icon: Icon(Icons.add_comment),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    NewReviewForEmployee(widget.ruid),
                              ),
                            );
                          })
                      : null,
                ),
                snapshot.data != null
                    ? reviews.isEmpty
                        ? SizedBox(
                            height: 100,
                            child: Center(
                              child: Text('No Reviews Yet'),
                            ),
                          )
                        : SizedBox(
                            height: 420,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: reviews.length,
                              itemBuilder: (ctx, i) => EmployeeReviewItem(
                                reviewerId: reviews[i]['reviewerId'],
                                rating: reviews[i]['rating'],
                                reviewPara: reviews[i]['reviewPara'],
                                shopImgUrl: reviews[i]['shopImgUrl'],
                                workedAs: reviews[i]['workedAs'],
                                shopName: reviews[i]['shopName'],
                              ),
                            ),
                          )
                    : SizedBox(
                        height: 100,
                        child: Center(
                          child: Text('Data not Found'),
                        ),
                      ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        });
  }
}

class EmployeeReviewItem extends StatelessWidget {
  final String reviewerId;
  // final String profileImageUrl;
  final String shopImgUrl;
  // final String name;
  final String workedAs;
  final double rating;
  final String reviewPara;
  final String shopName;
  EmployeeReviewItem(
      {this.rating,
      this.reviewPara,
      this.reviewerId,
      this.shopImgUrl,
      this.workedAs,
      this.shopName});
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
                  width: double.maxFinite,
                  fit: BoxFit.cover,
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
                          shopName,
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
                        workedAs,
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
                    initialRating: rating,
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
                  width: double.maxFinite,
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
                            reviewPara,
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
