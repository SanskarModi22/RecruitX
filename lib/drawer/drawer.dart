import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/drawer/about_us.dart';
import 'package:helping_hand/drawer/account.dart';
import 'package:helping_hand/drawer/profile.dart';
import 'package:helping_hand/login_page.dart';

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
                margin: EdgeInsets.zero,
                accountName: Text('Name'),
                accountEmail: Text('abc@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(""),
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
                  context, MaterialPageRoute(builder: (context) => profile()));
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
                  MaterialPageRoute(builder: (context) => login_page()));
            },
          ),
        ],
      ),
    );
  }
}
