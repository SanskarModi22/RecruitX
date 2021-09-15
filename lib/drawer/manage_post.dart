import 'package:flutter/material.dart';
import 'package:helping_hand/drawer/shop_details_screen.dart';

class ManagePost extends StatefulWidget {
  // const ManagePost({ Key? key }) : super(key: key);
  var isemployee;
  var isemployer;
  ManagePost({this.isemployee, this.isemployer});
  @override
  _ManagePostState createState() => _ManagePostState(
        isemployee: isemployee,
        isemployer: isemployer,
      );
}

class _ManagePostState extends State<ManagePost> {
  var isemployee;
  var isemployer;
  _ManagePostState({this.isemployee, this.isemployer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage your posts'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShopPostItem('Outfitters'),
              ShopPostItem('Penneys'),
              ShopPostItem('TopShop'),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopPostItem extends StatefulWidget {
  // const ShopPostItem({ Key? key }) : super(key: key);
  final String shopname;
  ShopPostItem(this.shopname);
  @override
  _ShopPostItemState createState() => _ShopPostItemState(shopname);
}

class _ShopPostItemState extends State<ShopPostItem> {
  final String shopname;
  _ShopPostItemState(this.shopname);
  var _isexpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(shopname),
            subtitle: Text('Jobs posted for this Shop.'),
            trailing: IconButton(
              iconSize: 35,
              color: Colors.teal,
              icon: Icon(
                _isexpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  _isexpanded = !_isexpanded;
                });
              },
            ),
          ),
          if (_isexpanded)
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              height: 400,
              child: ListView(
                children: [
                  AvailableJobItem(
                      id: '2',
                      job: 'job',
                      salary: '12555',
                      workDays: 'workDays',
                      workHours: 'workHours'),
                  AvailableJobItem(
                      id: '2',
                      job: 'job',
                      salary: '12555',
                      workDays: 'workDays',
                      workHours: 'workHours'),
                  AvailableJobItem(
                      id: '2',
                      job: 'job',
                      salary: '12555',
                      workDays: 'workDays',
                      workHours: 'workHours'),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class AvailableJobItem extends StatefulWidget {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  AvailableJobItem({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });

  @override
  _AvailableJobItemState createState() => _AvailableJobItemState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _AvailableJobItemState extends State<AvailableJobItem> {
  final String job;
  final String id;

  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;

  _AvailableJobItemState({
    this.job,
    this.salary,
    this.workDays,
    this.workHours,
    this.specialRequests,
    this.id,
  });

  var _owner = true;
  @override
  Widget build(BuildContext context) {
    return (_owner)
        ? Dismissible(
            key: ValueKey(id),
            background: Container(
              color: Colors.teal[200],
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
            confirmDismiss: (direction) {
              // return Future.value(true);
              return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text('Are you sure? '),
                        content:
                            Text('Do you want to delete this job posting?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                            child: Text('YES!'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: Text('NO!'),
                          ),
                        ],
                      ));
            },
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            child: InsideBody(
              id: id,
              job: job,
              salary: salary,
              workDays: workDays,
              workHours: workHours,
              specialRequests: specialRequests,
            ),
          )
        : InsideBody(
            id: id,
            job: job,
            salary: salary,
            workDays: workDays,
            workHours: workHours,
            specialRequests: specialRequests,
          );
  }
}

class InsideBody extends StatefulWidget {
  // const InsideBody({ Key? key }) : super(key: key);
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  InsideBody({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  @override
  _InsideBodyState createState() => _InsideBodyState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _InsideBodyState extends State<InsideBody> {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  String specialRequests;
  _InsideBodyState({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  @override
  var _expanded = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        border: Border.all(width: 3, color: Colors.teal),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                // height: 100,
                child: Column(
                  children: <Widget>[
                    // job title and salary
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              // horizontal: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              job,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            // width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Salary',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(2),
                                  width: 100,
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
                                    'Rs ' + salary,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // working hours
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              padding: EdgeInsets.only(left: 10, right: 15),
                              child: Text(
                                'Working Hours',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(2),
                                // width: 200,
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
                                  workHours,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_expanded)
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 0,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // width: 120,
                                padding: EdgeInsets.only(left: 10, right: 15),
                                child: Text(
                                  'Working Days',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  // width: 200,
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
                                    workDays,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (specialRequests != null && _expanded)
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.teal[100],
                          border: Border.all(
                            width: 2,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(specialRequests),
                      ),

                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned.fill(
                bottom: -25,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.teal[700],
                                width: 2,
                              ),
                              color: Colors.teal[200],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.teal[800],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.teal[700],
                                width: 2,
                              ),
                              color: Colors.teal[200],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.teal[800],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -25,
                right: 20,
                child: IconButton(
                  icon: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.teal[50],
                      child: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                        size: 22,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
