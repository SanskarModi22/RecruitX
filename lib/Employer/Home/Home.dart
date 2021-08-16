import 'package:flutter/material.dart';

class EmployerHome extends StatefulWidget {
  const EmployerHome({key}) : super(key: key);

  @override
  _EmployerHomeState createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {
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
