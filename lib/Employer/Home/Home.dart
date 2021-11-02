import 'package:flutter/material.dart';
import 'package:helping_hand/Services/Authentication.dart';
import 'package:helping_hand/Shared/base.dart';
import 'package:helping_hand/drawer/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:helping_hand/Model/user.dart';
// import 'package:provider/provider.dart';
// import '../../drawer/drawer.dart';

class EmployerHome extends StatefulWidget {
  const EmployerHome({key}) : super(key: key);

  @override
  _EmployerHomeState createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: drawer(),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //         accountName: Text("Employer"),
      //         accountEmail: Text(
      //           "admin@gmail.com",
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.logout,
      //           color: Colors.black,
      //         ),
      //         title: Text(
      //           'Sign out',
      //           textScaleFactor: 1.2,
      //           style: TextStyle(
      //             color: Colors.black,
      //           ),
      //         ),
      //         onTap: () async {
      //           _auth.signOut();
      //           final SharedPreferences preferences =
      //               await SharedPreferences.getInstance();
      //           preferences.remove('option');
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Base(),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
