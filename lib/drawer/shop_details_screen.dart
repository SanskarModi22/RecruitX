import 'dart:math';

import 'package:flutter/material.dart';
import './newjob.dart';

class ShopDetailsScreen extends StatefulWidget {
  // const ShopDetailsScreen({ Key? key }) : super(key: key);
  final String shopName;
  final String imageurl;
  final String shopType;
  ShopDetailsScreen({this.shopName, this.imageurl, this.shopType});
  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState(
        shopName: shopName,
        shopType: shopType,
        imageurl: imageurl,
      );
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  final String shopName;
  final String imageurl;
  final String shopType;
  _ShopDetailsScreenState({this.shopName, this.imageurl, this.shopType});
  @override
  Widget build(BuildContext context) {
    var jobslist = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(8),
                child: Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Image(
                          image: NetworkImage(imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                shopType + ' Shop',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(
                    Icons.room_preferences,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('Owner'),
                  subtitle: Text('Mellow Works'),
                  // trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.work,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('No of employees hired '),
                  subtitle: Text('30'),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.place_rounded,
                        color: Colors.teal,
                        size: 30,
                      ),

                      title: Text('Shop Address'),
                      // subtitle: Text('30'),
                      trailing: Icon(Icons.edit),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                          'Behind your house, in front of the pole, your ward, your city, your district, India'),
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.work_outline_rounded,
                        color: Colors.teal,
                        size: 30,
                      ),
                      title: Text('Jobs Available'),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
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
                              return NewJob();
                            },
                          );
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: min(jobslist * 120, 500),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: ListView(
                          children: <Widget>[
                            JobAvailable(
                              job: 'Cashier',
                              salary: 'Rs 30k',
                              workDays: 'Full Week excluding sun.',
                              workHours: '12:00 am to 5:00 pm',
                            ),
                            JobAvailable(
                              job: 'Security Guard',
                              salary: 'Rs 15k',
                              workDays: 'Mon, Wed, fri',
                              workHours: '9:00 am to 9:00 pm',
                            ),
                            JobAvailable(
                              job: 'Dish Washer',
                              salary: 'Rs 4k',
                              workDays: 'Sunday, Saturday',
                              workHours: '11:00 am to 5:00 pm',
                            ),
                            JobAvailable(
                              job: 'Dresser',
                              salary: 'Rs 40k',
                              workDays: 'Complete Week',
                              workHours: '9:00 am to 4:00 pm',
                            ),
                            JobAvailable(
                              job: 'Dancer',
                              salary: 'Rs 20k',
                              workDays: 'Tue, web, thr, fri',
                              workHours: '1:00 pm to 3:00 pm',
                            ),
                          ],
                        ),
                      ),
                    )
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

class JobAvailable extends StatelessWidget {
  // const JobAvailable({ Key? key }) : super(key: key);

  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  JobAvailable({this.job, this.salary, this.workDays, this.workHours});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 150,
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JobDetailItem(
                que: 'Job',
                ans: job,
              ),
              JobDetailItem(
                que: 'Salary',
                ans: salary,
              ),
            ],
          ),
          JobDetailItem(
            que: 'Work Hours',
            ans: workHours,
          ),
          JobDetailItem(
            que: 'Work Days',
            ans: workDays,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              // color: Colors.teal[100],
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Apply Now!',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JobDetailItem extends StatelessWidget {
  // const JobDetailItem({ Key? key }) : super(key: key);
  final String que;
  final String ans;
  JobDetailItem({this.ans, this.que});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: Colors.teal,
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              que,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.teal[100],
            ),
            child: Text(
              ans,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
