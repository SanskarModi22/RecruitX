import 'package:flutter/material.dart';

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
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Employer"),
              accountEmail: Text(
                "admin@gmail.com",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
