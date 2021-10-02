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
            title: Text('About us'),
            backgroundColor: Colors.teal,
          ),
          body: Center(child: Text('about us')),
        ),
      ),
    );
  }
}
