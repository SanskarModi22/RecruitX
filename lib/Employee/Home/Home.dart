import 'package:flutter/material.dart';
import '../screens/employee_account_screen.dart';

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
              currentAccountPicture: Image.network(
                  'https://qph.fs.quoracdn.net/main-qimg-20df28f3b31895e56cba6dbc0515c635'),
              accountName: Text("Mellow"),
              accountEmail: Text(
                "mellowworks@gmail.com",
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Account Settings',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(EmployeeAccountScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
