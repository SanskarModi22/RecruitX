import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

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
                    Container(
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(
                            loadedshop.shopImageUrl,
                          ),
                          fit: BoxFit.cover,
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
