import 'package:flutter/material.dart';

import 'package:helping_hand/Employee/Home/drawer.dart';

import 'package:helping_hand/Employee/Home/searchBar.dart';

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
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: searchBar()),
                  // IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: drawer(),
    );
  }
}
