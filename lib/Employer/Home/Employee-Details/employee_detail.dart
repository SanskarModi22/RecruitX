import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/employee_profile_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sizer/sizer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:url_launcher/url_launcher.dart';

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

class EmployeeDetailScreen extends StatefulWidget {
  // const JobDetailsScreen({ Key? key }) : super(key: key);

  final result;
  EmployeeDetailScreen({
    this.result,
  });

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  bool _hasCallSupport = false;
  Future<void> _launched;
  StreamSubscription subscription;


  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    subscription = Connectivity()
        .onConnectivityChanged
        .listen(showConnectivityResult);
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }
// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
  void showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    final message = hasInternet
        ? 'You are connected to Network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "+91$phoneNumber",
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    // var fetchAndSetUserinfoforEmployee =
    //     context.watch<GetUserInfo>().fetchAndSetUserinfoForEmployee;
    // final owner = loadedJob.ownerId;
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
    var result = widget.result;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee Details',
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
              child: _hasCallSupport
                  ?Text(
                "Contact Now!",
                style: TextStyle(color: Colors.white, fontSize: 17.6.sp),
              ):Text(
                "Calling not supported",
                style: TextStyle(color: Colors.white, fontSize: 17.6.sp),
              )
            ),
            onPressed: () {
              _hasCallSupport
                  ?  setState(() {
                _launched = _makePhoneCall(result['contact']);
              })
                  : null;
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
                child: Hero(
                  tag: result['img_url'],
                  child: ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      height: 45.h,
                      width: 100.w,
                      child: Image(
                        image: NetworkImage(
                          result['img_url'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(
                      image: NetworkImage(
                        'https://i.pinimg.com/originals/9a/25/d8/9a25d86d090fc965a7f9c0ad25668b10.jpg',
                      ),
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(result['name']),
                      Row(
                        children: [
                          Text(
                            "Age - ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(result['age'])
                        ],
                      )
                    ],
                  ),
                  subtitle: Text(result['contact']),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => EmployeeProfile(result.id)));
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.infoCircle,
                      color: randomColor,
                      size: 23.sp,
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
                        size: 27.sp,
                      ),
                      title: Text('Rating'),
                      subtitle: Text(result['averageRating'].toString()),
                      trailing: Column(
                        children: [
                          Text(
                            "Experience",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(result['experience'])
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.home_work_outlined,
                        color: randomColor,
                        size: 27.sp,
                      ),
                      title: Text('Currently Working At'),
                      subtitle: Text(result['currentWork']),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        color: randomColor,
                        size: 27.sp,
                      ),
                      title: Text('Expected Salary'),
                      subtitle: Text(
                          "${result['minExpSalary']}-${result['maxExpSalary']}"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.timer,
                        size: 27.sp,
                        color: randomColor,
                      ),
                      title: Text('Preferred Shift'),
                      subtitle: Text(result['preferredShift']),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        size: 27.sp,
                        color: randomColor,
                      ),
                      title: Text('Preferred Job-Type'),
                      subtitle: Text(result["expectedJobs"].toString()),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.place,
                        size: 27.sp,
                        color: randomColor,
                      ),
                      title: Text('Employee Address'),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 2.5.w, right: 2.5.w, bottom: 1.25.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.25.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: randomColor,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(result['address']),
                    ),
                  ],
                ),
              ),
              if (result['bio'] != null)
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.request_page,
                          size: 27.sp,
                          color: randomColor,
                        ),
                        title: Text('Bio'),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin:
                            EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.25.h),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3.75.w, vertical: 1.25.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: randomColor,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(result['bio']),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
