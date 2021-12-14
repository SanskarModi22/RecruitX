import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:helping_hand/Shared/loader.dart';

class NewReviewForEmployee extends StatefulWidget {
  final String rUid;

  NewReviewForEmployee(
    this.rUid,
  );
  @override
  State<NewReviewForEmployee> createState() => _NewReviewForEmployeeState();
}

class _NewReviewForEmployeeState extends State<NewReviewForEmployee> {
  @override
  Widget build(BuildContext context) {
    final cUid = FirebaseAuth.instance.currentUser.uid;
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('shops')
            .where('ownerId', isEqualTo: cUid)
            .get(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ColorLoader3();
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
          if (_items == null || _items.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                  // backgroundColor: Colors.white,
                  // foregroundColor: Colors.white,
                  ),
              body: Center(
                child: Text('Please Add a Shop First'),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Write a Review'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.teal[600],
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _MyForm(
                  widget.rUid,
                  items: _items,
                  shops: shops,
                )),
          );
        });
  }
}

class _MyForm extends StatefulWidget {
  // const _MyForm({ Key? key }) : super(key: key);
  final String rUid;
  List items;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> shops;
  _MyForm(this.rUid, {@required this.items, @required this.shops});
  @override
  __MyFormState createState() => __MyFormState();
}

class __MyFormState extends State<_MyForm> {
  double _rating = 3.0;
  var _reviewPara = '';
  var _workedAs = 'Peon';
  final workedAsCtrl = TextEditingController();
  final reviewParaCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _shopName = 'Choose a Shop';
  var _shopImgUrl = '';

  void getShopData(String shopName) {
    final shopData =
        widget.shops.firstWhere((element) => element['shopName'] == shopName);
    setState(() {
      _shopImgUrl = shopData['shopImgUrl'];
      _shopName = shopData['shopName'];
    });
  }

  Future<void> addReviewForEmployee(String cuid, String ruid) async {
    // ruid = user id of employer who is being reviewed
    // cuid = user id of current user i.e who is reviewing
    final isValid = _formKey.currentState.validate();
    if (_shopName == 'Choose a Shop') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Choose a Shop'),
        ),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    if (isValid == true) {
      _formKey.currentState.save();
      getShopData(_shopName);
      try {
        await FirebaseFirestore.instance.collection('employeeReviews').add(
          {
            // change fields
            'reviewedId': ruid,
            'reviewerId': cuid,
            'workedAs': _workedAs,
            'shopName': _shopName,

            'shopImgUrl': _shopImgUrl,
            'rating': _rating,
            'reviewPara': _reviewPara,
          },
        ).then((value) => () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You reviewed successfully.')),
              );
              Navigator.of(context).pop();
            });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cUid = FirebaseAuth.instance.currentUser.uid;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          // height: 400,
          color: Colors.white,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center      ,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: RatingBar.builder(
                    itemSize: 40,
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.teal[100],
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      )),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Worked In :',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      DropdownButton<String>(
                        value: _shopName,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            _shopName = newValue;
                          });
                        },
                        menuMaxHeight: 200,
                        items: widget.items,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.teal[100],
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      )),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Worked As:',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      DropdownButton<String>(
                        value: _workedAs,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            _workedAs = newValue;
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
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.teal[100],
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      )),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: TextFormField(
                    controller: reviewParaCtrl,
                    onSaved: (val) {
                      setState(() {
                        _reviewPara = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some review';
                      }
                      return null;
                    },
                    maxLines: 5,
                    maxLength: 150,
                    decoration: InputDecoration(
                      labelText: 'Decribe your Experience',
                      labelStyle: TextStyle(color: Colors.teal[900]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    addReviewForEmployee(cUid, widget.rUid);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal,
                          border: Border.all(
                            color: Colors.teal,
                            // width:
                          )),
                      // margin: EdgeInsets.only(top: 20, bottom: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          // color: Colors.teal[900],
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
