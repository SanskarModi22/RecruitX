import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewJob extends StatefulWidget {
  @override
  State<NewJob> createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  Widget build(BuildContext context) {
    final uId = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('shops')
          .where('ownerId', isEqualTo: uId)
          .get(),
      builder:
          (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final shops = snapshot.data.docs;

        final _shopNames = ['Choose a Shop'];

        shops.forEach((element) {
          _shopNames.add(element['shopName'].toString());
        });
        print(_shopNames);

        List<DropdownMenuItem<String>> _items = [];

        _shopNames.forEach((name) {
          _items.add(
            DropdownMenuItem<String>(
              value: name,
              child: Text(
                name,
                style: TextStyle(fontSize: 12.3.sp),
              ),
            ),
          );
        });
        print(_items);
        if (shops == null || shops.isEmpty) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/waiting.png',
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please add a shop first !',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Post a new Job.'),
          ),
          // resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.all(15.sp),
            // margin: EdgeInsets.all(8),
            // height: 600,
            child: _MyForm(_items, shops),
          ),
        );
      },
    );
  }
}

class _MyForm extends StatefulWidget {
  // const _MyForm({ Key? key }) : super(key: key);
  List _items;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> shops;

  _MyForm(this._items, this.shops);
  @override
  __MyFormState createState() => __MyFormState();
}

class __MyFormState extends State<_MyForm> {
  TextEditingController _jobTitle = TextEditingController();
  TextEditingController _shopname = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _vacancy = TextEditingController();
  TextEditingController _specialReq = TextEditingController();
  TextEditingController _workingHours = TextEditingController();
  // TextEditingController _jobID = TextEditingController();
  TextEditingController _workingDays = TextEditingController();
  void clear() {
    _jobTitle.clear();
    _shopname.clear();
    _salary.clear();
    _workingDays.clear();
    _vacancy.clear();
    _specialReq.clear();
    _workingHours.clear();
  }

  var id;
  final _formkey = GlobalKey<FormState>();
  String jobName = 'Peon';
  String shopName = 'Choose a Shop';

  String contact;
  String ownerId;
  String ownerImgUrl;
  String ownerName;
  String shopAddress;
  String city;
  String shopId;
  String shopImgUrl;
  String shopType;
  bool _nightShift = false;
  bool _partTime = true;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<MyUser>(context);
    final uId = FirebaseAuth.instance.currentUser.uid;
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');

    Future<void> getUserData() async {
      final owner = await FirebaseFirestore.instance
          .collection('employerProfile')
          .doc(uId)
          .get();

      setState(() {
        contact = owner['contact'];
        ownerId = owner.id;
        ownerImgUrl = ownerImgUrl = owner['employerImg'];
        ownerName = owner['name'];
      });
    }

    void getShopData(String shopName) {
      final shopData =
          widget.shops.firstWhere((element) => element['shopName'] == shopName);
      setState(() {
        shopAddress = shopData['shopAddress'];
        shopId = shopData.id;
        shopImgUrl = shopData['shopImgUrl'];
        shopType = shopData['shopType'];
        city = shopData['city'];
      });
    }

    Future<void> postJob() async {
      await getUserData();
      if (_formkey.currentState.validate()) {
        if (shopName == 'Please Choose a Shop') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Choose a shop')));
          return;
        }
        getShopData(shopName);
        try {
          jobs.add({
            "jobName": jobName,
            "shopName": shopName,
            "salary": double.parse(_salary.text),
            "vacancy": _vacancy.text,
            "specialRequest":
                _specialReq.text.isNotEmpty ? _specialReq.text : '',
            "workingHours": _workingHours.text,
            // "jobId": jobs.parent.id,
            "workingDays": _workingDays.text,
            "contact": contact,
            "ownerId": ownerId,
            "ownerImgUrl": ownerImgUrl,
            "ownerName": ownerName,
            "shopAddress": shopAddress,
            "shopId": shopId,
            "shopImgUrl": shopImgUrl,
            "shopType": shopType,
            "partTime": _partTime,
            "nightShift": _nightShift,
            "city": city,
          });
          Navigator.of(context).pop();
          clear();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to post new job')),
          );
        }
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.maps_home_work,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 3.75.w,
                      ),
                      Text(
                        'In Shop:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      DropdownButton<String>(
                        value: shopName,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            shopName = newValue;
                          });
                        },
                        menuMaxHeight: 25.h,
                        items: widget._items,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 3.75.w,
                      ),
                      Text(
                        'Looking For:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        width: 3.75.w,
                      ),
                      DropdownButton<String>(
                        value: jobName,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            jobName = newValue;
                          });
                        },
                        menuMaxHeight: 37.5.h,
                        items: <String>[
                          'Peon',
                          'Driver',
                          'Tutor',
                          'Security Guard',
                          'Halwai',
                          'Labour',
                          'Watchman',
                          'Delivery Boy',
                          'Waiter',
                          'Maid',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Monthly Salary
            TextFormField(
              controller: _salary,
              maxLength: 20,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(8),
                icon: Icon(Icons.monetization_on_outlined),
                hintText: 'e.g  Rs 15,000',
                labelText: 'Monthly salary (in Rupees)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return '*required';
                if (double.parse(value) > 100000) {
                  return 'salary should be less than 50000';
                }
                return null;
              },
              keyboardType: TextInputType.numberWithOptions(),
            ),
            // Working Hours
            TextFormField(
              controller: _workingHours,
              maxLength: 50,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(8),
                icon: Icon(Icons.watch_later_outlined),
                hintText: 'e.g. 9:00 am to 5:00 pm',
                labelText: 'Working Hours',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return '*required';
                return null;
              },
            ),
            TextFormField(
              controller: _workingDays,
              maxLength: 50,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(8),
                icon: Icon(Icons.watch_later),
                hintText: 'Everyday except sunday',
                labelText: 'Working Days',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return '*required';
                return null;
              },
            ),
            ListTile(
              leading: Icon(
                _partTime ? Icons.hourglass_full : Icons.hourglass_bottom,
                // color: Colors.blue,
              ),
              // contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: _partTime ? Text('Part-Time') : Text('Full-Time'),
              trailing: Switch(
                value: _partTime,
                onChanged: (val) {
                  setState(() {
                    _partTime = val;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(
                _nightShift ? Icons.nightlight : Icons.wb_sunny,
                // color: Colors.blue,
              ),
              // contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: _nightShift ? Text('Night-Shift') : Text('Day-Shift'),
              trailing: Switch(
                value: _nightShift,
                onChanged: (val) {
                  setState(() {
                    _nightShift = val;
                  });
                },
              ),
            ),
            TextFormField(
              controller: _vacancy,
              maxLength: 50,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(8),
                icon: Icon(Icons.people),
                hintText: 'Eg:3',
                labelText: 'No of Openings',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return '*required';
                return null;
              },
            ),
            TextFormField(
              controller: _specialReq ?? null,
              maxLines: 3,
              maxLength: 150,
              decoration: InputDecoration(
                icon: Icon(Icons.info_outline),
                labelText: 'Other info',
                labelStyle: TextStyle(
                  color: Colors.teal[900],
                ),
                hintText: 'This Section is Optional',
              ),
            ),

            TextButton(
              onPressed: () {
                postJob();
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                  ),
                  // margin: EdgeInsets.only(top: 20, bottom: 0),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
