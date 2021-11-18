import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:provider/provider.dart';

class NewJob extends StatefulWidget {
  // const NewJob({ Key? key }) : super(key: key);
//
  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  TextEditingController _jobTitle = TextEditingController();
  TextEditingController _shopname = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _vacancy = TextEditingController();
  TextEditingController _specialReq = TextEditingController();
  TextEditingController _workingHours = TextEditingController();
  TextEditingController _jobID = TextEditingController();
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
  @override
  final _formkey = GlobalKey<FormState>();
  String dropdownValue = 'Peon';
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    CollectionReference jobs = FirebaseFirestore.instance
        .collection('shops')
        .doc(user.uid)
        .collection('jobs');
    return Form(
      key: _formkey,
      child: Container(
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.all(8),
        height: 600,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Text(
                  'Post a new Job',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
                  ),
                ),
                // Shop
                TextFormField(
                  controller: _shopname,
                  maxLength: 20,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(8),
                    icon: Icon(Icons.store_sharp),
                    hintText: 'e.g shop',
                    labelText: 'In Shop',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) return '*required';
                    return null;
                  },
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Looking For:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
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
                // Job title

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
                      hintText: 'This Section is Optional'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return '*required';
                    return null;
                  },
                ),

                TextButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {}

                    jobs.add({
                      "jobTitle": _jobTitle.text,
                      "shopName": _shopname.text,
                      "salary": _salary.text,
                      "vacancy": _vacancy.text,
                      "Details": _specialReq.text,
                      "workingHours": _workingHours.text,
                      "jobId": jobs.parent.id,
                      "woringDays": _workingDays.text,
                    });
                    clear();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal,
                      ),
                      margin: EdgeInsets.only(top: 20, bottom: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
        ),
      ),
    );
  }
}
