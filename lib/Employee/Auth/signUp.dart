import 'package:flutter/material.dart';

class EmployeeSignUp extends StatefulWidget {
  const EmployeeSignUp({key}) : super(key: key);

  @override
  _EmployeeSignUpState createState() => _EmployeeSignUpState();
}

class _EmployeeSignUpState extends State<EmployeeSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUP"),
      ),
    );
  }
}
