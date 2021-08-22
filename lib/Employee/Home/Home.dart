import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/filter.dart';

import 'package:helping_hand/Employee/Home/searchBar.dart';
import 'package:helping_hand/cards.dart';
import 'package:helping_hand/drawer/drawer.dart';
import 'package:helping_hand/job_options.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({key}) : super(key: key);

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[searchBar(), Filter()],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   searchBar(),
                  //   Filter()
                  //   // IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                  // ],
                  ),
            ),
            Center(
                child: Text(
              "Job Options",
              style: TextStyle(fontSize: 24.0),
            )),
            JobOptions(),
            Center(
                child: Text(
              "High Paying Jobs",
              style: TextStyle(fontSize: 24.0),
            )),
            JobCards(),
          ],
        ),
      ),
      drawer: drawer(),
    );
  }
}
