import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:provider/provider.dart';

class NewJob extends StatefulWidget {
  // const NewJob({ Key? key }) : super(key: key);
//

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
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        });
        print(_items);
        if (shops == null || shops.isEmpty) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Please Add a Shop First'),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Post a new Job.'),
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.all(20),
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
  String shopId;
  String shopImgUrl;
  String shopType;

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
        ownerImgUrl =
            'https://i.pinimg.com/originals/24/1c/d8/241cd83e43200decd3057d14eb407c2d.jpg';
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
            "salary": _salary.text,
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
                        width: 15,
                      ),
                      Text(
                        'In Shop:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        width: 20,
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
                        menuMaxHeight: 200,
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
                        width: 15,
                      ),
                      Text(
                        'Looking For:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(
                        width: 15,
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
                        menuMaxHeight: 300,
                        items: <String>[
                          'Peon',
                          'Driver',
                          'Private Tutor',
                          'Security Gaurd',
                          'Halwai',
                          'Labour',
                          'Watchman',
                          'Sweeper',
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
