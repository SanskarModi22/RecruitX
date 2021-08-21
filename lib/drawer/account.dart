import 'package:flutter/material.dart';

void main() {
  runApp(account());
}

// ignore: camel_case_types
class account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

// ignore: camel_case_types
class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: Text('Account'),
        ),
      ),
    );
  }
}
