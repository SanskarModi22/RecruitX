// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/manage_applications.dart';
import 'package:helping_hand/Employee/Home/manage_post_screen.dart';
import 'package:helping_hand/Services/Authentication.dart';
import 'package:helping_hand/Splash/splash_screen.dart';
import 'package:helping_hand/drawer/applicants.dart';
// import 'package:helping_hand/drawer/rate_us.dart';
// import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/about_us_screen.dart';
import 'package:helping_hand/screens/account_screen.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';
// import 'package:helping_hand/screens/filters_Employer_screen.dart';
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

    final userId = FirebaseAuth.instance.currentUser.uid;

    return Drawer(
      child: ListView(
        children: [
          _DrawerHead(
            isEmployee: userIsEmployee,
            isEmployer: userIsEmployer,
            uId: userId,
          ),
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
          // SizedBox(
          //   height: 10,
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.book,
          //     color: Colors.black,
          //   ),
          //   title: Text(
          //     'About us',
          //     textScaleFactor: 1.2,
          //     style: TextStyle(
          //       color: Colors.black,
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => aboutus()));
          //   },
          // ),
          SizedBox(
            height: 10,
          ),
          if (userIsEmployee == true)
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
                    : Navigator.of(context).pop();
              },
            ),
          if (userIsEmployee == true)
            SizedBox(
              height: 10,
            ),
          if (userIsEmployer == true)
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'Applicants',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApplicantsPage()),
                );
              },
            ),
          if (userIsEmployer == true)
            SizedBox(
              height: 10,
            ),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            title: Text(
              userIsEmployer
                  ? 'Manage Posts'
                  : userIsEmployee
                      ? 'Manage Applications'
                      : null,
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
                        builder: (context) => JobApplication(),
                      ),
                    )
                  : userIsEmployer
                      ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ManagePost()),
                        )
                      : Navigator.of(context).pop();
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

class _DrawerHead extends StatelessWidget {
  // const _DrawerHead({ Key? key }) : super(key: key);
  bool isEmployee;
  bool isEmployer;
  String uId;
  _DrawerHead({this.isEmployee, this.isEmployer, this.uId});

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData() {
    if (isEmployee == true) {
      return FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(uId)
          .get();
    }
    if (isEmployer == true) {
      return FirebaseFirestore.instance
          .collection('employerProfile')
          .doc(uId)
          .get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: new DecorationImage(
                  image: NetworkImage(
                      "https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final userData = snapshot.data;
        return DrawerHeader(
          curve: Curves.linear,
          duration: Duration(milliseconds: 0),
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: new DecorationImage(
                  image: isEmployer
                      ? NetworkImage(userData['shopImg'])
                      : NetworkImage(
                          "https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg"),
                  fit: BoxFit.cover),
            ),
            margin: EdgeInsets.zero,
            accountName: Text(
              userData['name'],
              style: TextStyle(
                  color: Colors.white, backgroundColor: Colors.transparent),
            ),
            accountEmail: Text(
              '+91 ' + userData['contact'],
              style: TextStyle(
                  color: Colors.white, backgroundColor: Colors.transparent),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              radius: 35,
              child: CircleAvatar(
                radius: 33,
                backgroundColor: Colors.blueGrey,
                backgroundImage: isEmployer
                    ? NetworkImage(userData['employerImg'])
                    : NetworkImage(userData['img_url']),
              ),
            ),
          ),
        );
      },
    );
  }
}
