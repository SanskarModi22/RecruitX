import 'package:flutter/material.dart';

void main() {
  runApp(aboutus());
}

// ignore: camel_case_types
class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          body: Center(child: Text('about us')),
        ),
      ),
    );
  }
}
