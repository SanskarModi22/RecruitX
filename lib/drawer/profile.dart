import 'package:flutter/material.dart';

void main() {
  runApp(profile());
}

// ignore: camel_case_types
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Text('profile page'),
        ),
      ),
    );
  }
}
