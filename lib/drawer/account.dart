import 'package:flutter/material.dart';

void main() {
  runApp(account());
}

// ignore: camel_case_types
class account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

// ignore: camel_case_types
class _accountState extends State<account> {
  // ignore: non_constant_identifier_names
  var _notification_enabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manage Details',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Manage information about you and your account in general.',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.account_circle_rounded,
                                size: 35,
                              ),
                              title: Text('Profile information'),
                              subtitle: Text(
                                  'Update your name, phone number, emails, images etc'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Security',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.phonelink_setup,
                                size: 35,
                              ),
                              title: Text('Phone Number'),
                              subtitle: Text('Update your mobile phone number'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.vpn_key,
                                size: 35,
                              ),
                              title: Text('Password'),
                              subtitle: Text('Update your mobile phone number'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              leading: Icon(
                                _notification_enabled
                                    ? Icons.notifications_active
                                    : Icons.notifications_off,
                                size: 35,
                              ),
                              title: Text('Get notifications'),
                              subtitle: Text('Disable notifications'),
                              trailing: Switch(
                                  value: _notification_enabled,
                                  onChanged: (val) {
                                    setState(() {
                                      _notification_enabled = val;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Management',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              minVerticalPadding: 8,
                              leading: Icon(
                                Icons.cancel_rounded,
                                size: 35,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Deactivate Account',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Temporarily disable your account until you login again.',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                ),
                              ),
                              onLongPress: () {
                                // disable account
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.delete_forever,
                                size: 35,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Delete Account',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Permanently delete your account.',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                ),
                              ),
                              onLongPress: () {
                                /// delete account
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
