import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
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
