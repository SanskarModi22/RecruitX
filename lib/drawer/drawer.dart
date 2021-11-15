import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Services/Authentication.dart';
import 'package:helping_hand/drawer/rate_us.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/about_us_screen.dart';
import 'package:helping_hand/screens/account_screen.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';
import 'package:helping_hand/screens/filters_Employer_screen.dart';
import 'package:helping_hand/screens/manage_post_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Shared/base.dart';
import 'help.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/screens/employer_profile_screen.dart';
import 'package:helping_hand/screens/employee_profile_screen.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<drawer> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    bool userIsEmployee = Provider.of<UserType>(context).userAsEmployee;
    bool userIsEmployer = Provider.of<UserType>(context).userAsEmployer;
    final user = Provider.of<MyUser>(context);

    final String employeeName = Provider.of<GetUserInfo>(context)
        .fetchAndSetUserinfoForEmployee
        .employeeName;
    final String employeeContactNo = Provider.of<GetUserInfo>(context)
        .fetchAndSetUserinfoForEmployee
        .employeeContactNumber;
    final String employerName = Provider.of<GetUserInfo>(context)
        .fetchAndSetUserinfoForEmployer
        .employerName;
    final String employerContactNo = Provider.of<GetUserInfo>(context)
        .fetchAndSetUserinfoForEmployer
        .employerContactNumber;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: new DecorationImage(
                      image: NetworkImage(
                          "https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg"),
                      fit: BoxFit.cover),
                ),
                margin: EdgeInsets.zero,
                accountName: userIsEmployer
                    ? Text(employerName)
                    : userIsEmployee
                        ? Text(employeeName)
                        : Text('Unknown Data'),
                accountEmail: userIsEmployer
                    ? Text(employerContactNo)
                    : userIsEmployee
                        ? Text(employeeContactNo)
                        : Text('Unknown Data'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  radius: 35,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/9a/25/d8/9a25d86d090fc965a7f9c0ad25668b10.jpg'),
                  ),
                ),
              )),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              'Profile',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              userIsEmployee
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeProfile(
                          FirebaseAuth.instance.currentUser.uid,
                        ),
                      ),
                    )
                  : userIsEmployer
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployerProfile(
                              FirebaseAuth.instance.currentUser.uid,
                            ),
                          ),
                        )
                      : Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.black,
            ),
            title: Text(
              'Account',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => account()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.black,
            ),
            title: Text(
              'About us',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => aboutus()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt_rounded,
              color: Colors.black,
            ),
            title: Text(
              'Filters',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              userIsEmployee
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeFilterScreen(),
                      ),
                    )
                  : userIsEmployer
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployerFilterScreen(),
                          ),
                        )
                      : Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            title: Text(
              'Manage Posts',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManagePost()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.thumb_up,
              color: Colors.black,
            ),
            title: Text(
              'Rate us',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RateUs(),
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
            ),
            title: Text(
              'Help',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => help(),
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              'Sign out',
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () async {
              _auth.signOut();
              final SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.remove('option');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Base(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
