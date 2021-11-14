import 'package:flutter/material.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
// class JobDetail extends StatefulWidget {
//   const JobDetail({Key key, this.jobId, this.shopId}) : super(key: key);
//   final String jobId;
//   final String shopId;
//   @override
//   _JobDetailState createState() => _JobDetailState();
// }
//
// class _JobDetailState extends State<JobDetail> {
//   @override
//   Widget build(BuildContext context) {
//     var fetchAndSetEmployerShops2 =
//         context.watch<GetUserInfo>().fetchAndSetEmployerShops;
//     final loadedShop = fetchAndSetEmployerShops2.shops
//         .firstWhere((element) => element.shopid == widget.shopId);
//     final loadedJob = loadedShop.jobsAvailable
//         .firstWhere((element) => element.jobId == widget.jobId);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           loadedShop.shopName,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         backgroundColor: Colors.pinkAccent,
//         automaticallyImplyLeading: false,
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           color: Colors.transparent,
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.cyan,
//             size: 20,
//           ),
//         ),
//       ),
// backgroundColor:  Color.fromRGBO(237, 240, 245, 1),
// bottomNavigationBar: BottomAppBar(
//   color:  Color.fromRGBO(237, 240, 245, 1),
//     child: Row(
//   children: [
//     SizedBox(width: 33.w,),
//         ElevatedButton(
//
//       onPressed: (){},
//
//       style: ButtonStyle(
//
//         backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
//
//         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),)
//
//       ),
//
//       child: Text("Apply Now",style: TextStyle(fontSize: 22),),
//
//     ),
//   ],
// )),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Hero(
//               tag: loadedShop.shopImageUrl,
//               child: ClipPath(
//                 clipper: ClipPathClass(),
//                 child: Container(
//                   height: 45.h,
//                   width: 100.w,
//                   child: Image.network(
//                     loadedShop.shopImageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "Employer Name - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedShop.ownerName,style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Text(
//                         "Shop Address - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Container(
//                         width: 60.w,
//                         height: 5.h,
//                         child: Text(
//                           loadedShop.shopAddress,
//                           maxLines: 2,
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Text(
//                         "Shop Type - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedShop.shopType,style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(width: 50,),
//                       Text(
//                         "Job Type - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedShop.shopType,style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "Salary Offered  ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                           ),
//                           Text(
//                             loadedJob.salary,style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//
//                       SizedBox(width: 40,),
//                       Column(
//                         children: [
//                           Text(
//                             "Working Hours",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                           ),
//                           Text(
//                             loadedJob.workingHours,style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Text(
//                         "Working Days - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedJob.workingDays,style: TextStyle(fontSize: 16),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Column(
//                     children: [
//                       Text(
//                         "Job Description ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedJob.specialRequest??"null",style: TextStyle(fontSize: 16),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Text(
//                         "No of Openings - ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
//                       ),
//                       Text(
//                         loadedJob.vacancy??"null",style: TextStyle(fontSize: 16),
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
    final loadedshop = Provider.of<GetUserInfo>(context)
        .fetchAndSetEmployerShops
        .shops
        .firstWhere((shopEx) => shopEx.shopid == shopId);
    final loadedJob = loadedshop.jobsAvailable
        .firstWhere((element) => element.jobId == jobId);

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
    final Color random_color = _color;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Job Details',
          style: TextStyle(color: random_color),
        ),
        iconTheme: IconThemeData(
          color: random_color,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: <Widget>[
              Card(
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: loadedshop.shopImageUrl,
                      child: ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          height: 45.h,
                          width: 100.w,
                          child: Image(
                            image: NetworkImage(
                              loadedshop.shopImageUrl,
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
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                        ),
                        child: Text(loadedshop.shopType),
                      ),
                    ),
                    Positioned.fill(
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.85),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.home),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(loadedshop.shopName),
                              ],
                            ),
                          ),
                        ))
                  ],
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
                  title: Text('Owner Name'),
                  subtitle: Text('Contact Number'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.infoCircle,
                      color: random_color,
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
                        color: random_color,
                        size: 35,
                      ),
                      title: Text('Job'),
                      subtitle: Text(loadedJob.jobName),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        color: random_color,
                        size: 35,
                      ),
                      title: Text('Salary'),
                      subtitle: Text(loadedJob.salary),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.timer,
                        size: 35,
                        color: random_color,
                      ),
                      title: Text('Work Hours'),
                      subtitle: Text(loadedJob.workingHours),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        size: 35,
                        color: random_color,
                      ),
                      title: Text('Work Days'),
                      subtitle: Text(loadedJob.workingDays),
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
                        size: 35,
                        color: random_color,
                      ),
                      title: Text('Shop Address'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: random_color,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(loadedshop.shopAddress),
                    ),
                  ],
                ),
              ),
              if (loadedJob.specialRequest != null)
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.request_page,
                          size: 35,
                          color: random_color,
                        ),
                        title: Text('Special requests'),
                      ),
                      Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: random_color,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(loadedJob.specialRequest),
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
