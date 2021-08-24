import 'package:flutter/material.dart';
import '../screens/employer_account_screen.dart';

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
              currentAccountPicture: Image.network(
                  'https://qph.fs.quoracdn.net/main-qimg-20df28f3b31895e56cba6dbc0515c635'),
              accountName: Text("Employer"),
              accountEmail: Text(
                "admin@gmail.com",
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
                    .pushNamed(EmployeerAccountScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
