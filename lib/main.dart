import 'package:flutter/material.dart';
import 'package:helping_hand/base.dart';
import './Employee/screens/employee_account_screen.dart';
import './Employer/screens/employer_account_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Base(),
      routes: {
        EmployeeAccountScreen.routeName: (ctx) => EmployeeAccountScreen(),
        EmployeerAccountScreen.routeName: (ctx) => EmployeerAccountScreen(),
      },
    );
  }
}
