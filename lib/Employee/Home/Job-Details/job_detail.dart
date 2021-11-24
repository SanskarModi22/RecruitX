import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/employer_profile_screen.dart';
import 'package:helping_hand/screens/shop_details_screen.dart';
// import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class JobDetailsScreen extends StatefulWidget {
  // const JobDetailsScreen({ Key? key }) : super(key: key);
  final String jobId;
  final String shopId;
  JobDetailsScreen({this.jobId, this.shopId});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState(
        jobId: jobId,
        shopId: shopId,
      );
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final String jobId;
  final String shopId;
  _JobDetailsScreenState({this.jobId, this.shopId});
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.dark,
      // colorSaturation: ColorSaturation.highSaturation,
      colorHue: ColorHue.multiple(colorHues: [
        ColorHue.red,
        ColorHue.blue,
        ColorHue.orange,
        ColorHue.pink
      ]),
    );
    final Color randomColor = _color;

    Future<void> apply() async {
      final cUser = FirebaseAuth.instance.currentUser.uid;
      // fetching employee data
      final userData = await FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(cUser)
          .get();

      //  posting job
      try {
        await FirebaseFirestore.instance
            .collection('jobs')
            .doc(widget.jobId)
            .collection('applicants')
            .doc(userData.id)
            .set({
          'applicantId': userData.id,
          'applicantName': userData['name'],
          'contact': userData['contact'],
          'profileImage': userData['img_url'],
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have Applied for this Job'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to Apply for the Job'),
          ),
        );
      }
    }

    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('jobs').doc(widget.jobId).get(),
      builder: (ctx,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == null) {
          return Scaffold(
            body: Center(
              child: Text('No Job Found'),
            ),
          );
        }
        if (!snapshot.data.exists) {
          return Scaffold(
            body: Center(
              child: Text('No Job Found'),
            ),
          );
        }
        final job = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Job Details',
              style: TextStyle(color: randomColor),
            ),
            iconTheme: IconThemeData(
              color: randomColor,
            ),
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 4.0, bottom: 2.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  shadowColor: randomColor,
                  primary: randomColor,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Apply Now!",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
                onPressed: () {
                  apply();
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: job['shopImgUrl'],
                          child: ClipPath(
                            clipper: ClipPathClass(),
                            child: Container(
                              height: 45.h,
                              width: 100.w,
                              child: Image(
                                image: NetworkImage(
                                  job['shopImgUrl'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Text(job['shopType']),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.maps_home_work,
                        color: randomColor,
                        size: 35,
                      ),
                      title: Text(job['shopName']),
                      subtitle: Text(job['shopType']),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ShopDetailsScreen(
                                  providedShopId: job['shopId']),
                            ),
                          );
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.infoCircle,
                          color: randomColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(job['ownerImgUrl']),
                      ),
                      title: Text(job['ownerName']),
                      subtitle: Text(job['contact']),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => EmployerProfile(job['ownerId']),
                            ),
                          );
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.infoCircle,
                          color: randomColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.work,
                            color: randomColor,
                            size: 35,
                          ),
                          title: Text('Job'),
                          subtitle: Text(job['jobName']),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.attach_money_rounded,
                            color: randomColor,
                            size: 35,
                          ),
                          title: Text('Salary'),
                          subtitle: Text(job['salary'].toString()),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.timer,
                            size: 35,
                            color: randomColor,
                          ),
                          title: Text('Work Hours'),
                          subtitle: Text(job['workingHours']),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            size: 35,
                            color: randomColor,
                          ),
                          title: Text('Work Days'),
                          subtitle: Text(job['workingDays']),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.people,
                        size: 35,
                        color: randomColor,
                      ),
                      title: Text('Vacancies'),
                      trailing: CircleAvatar(
                        backgroundColor: randomColor,
                        child: Text(job['vacancy']),
                      ),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.place,
                            size: 35,
                            color: randomColor,
                          ),
                          title: Text('Shop Address'),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: randomColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(job['shopAddress']),
                        ),
                      ],
                    ),
                  ),
                  if (job['specialRequest'] != '')
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.request_page,
                              size: 35,
                              color: randomColor,
                            ),
                            title: Text('Special requests'),
                          ),
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: randomColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(job['specialRequest']),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
