import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:helping_hand/screens/employee_profile_screen.dart';


class JobDetailsScreen extends StatelessWidget {
  // const JobDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Job Details',
          style: TextStyle(color: Colors.teal),
        ),
        iconTheme: IconThemeData(
          color: Colors.teal,
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
                            'https://ichef.bbci.co.uk/news/976/cpsprodpb/8A13/production/_116574353_gettyimages-1229868118.jpg',
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
                        child: Text('Shop Type'),
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
                                Text('Shop Name'),
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
                      color: Colors.teal,
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
                        color: Colors.blue[600],
                        size: 35,
                      ),
                      title: Text('Job'),
                      subtitle: Text('Manager etc'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.attach_money_rounded,
                        color: Colors.blue[600],
                        size: 35,
                      ),
                      title: Text('Salary'),
                      subtitle: Text('ex 15,000'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.timer,
                        size: 35,
                        color: Colors.blue[600],
                      ),
                      title: Text('Work Hours'),
                      subtitle: Text('Working hours'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        size: 35,
                        color: Colors.blue[600],
                      ),
                      title: Text('Work Days'),
                      subtitle: Text('Working DAys'),
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
                        color: Colors.blue[600],
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
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                          'Pahado ke uppar, jungle ke par, dekho kon apne shahar aya yrr'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.request_page,
                        size: 35,
                        color: Colors.blue[600],
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
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                          'Pahado ke uppar, jungle ke par, dekho kon apne shahar aya yrr'),
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
