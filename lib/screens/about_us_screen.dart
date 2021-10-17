import 'package:flutter/material.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(aboutus());
}

// ignore: camel_case_types
class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool userIsEmployee = Provider.of<UserType>(context).userAsEmployee;
    bool userIsEmployer = Provider.of<UserType>(context).userAsEmployer;
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'About us',
              style: TextStyle(color: Colors.teal),
            ),
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: userIsEmployee
                ? Text('User is a Employee')
                : userIsEmployer
                    ? Text('User  is a Employer')
                    : Text('User Unknown'),
          ),
        ),
      ),
    );
  }
}
