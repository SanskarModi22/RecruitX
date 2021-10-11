import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/screens/about_us_screen.dart';
import 'package:helping_hand/screens/account_screen.dart';
import 'package:helping_hand/drawer/help.dart';
import 'package:helping_hand/screens/manage_post_screen.dart';
import 'package:helping_hand/screens/profile_screen.dart';
import 'package:helping_hand/drawer/rate_us.dart';

void main() {
  runApp(drawer());
}

// ignore: camel_case_types
class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
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
                accountName: Text('Mellow'),
                accountEmail: Text('+91 8888888888'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/9a/25/d8/9a25d86d090fc965a7f9c0ad25668b10.jpg'),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginEmp()));
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
