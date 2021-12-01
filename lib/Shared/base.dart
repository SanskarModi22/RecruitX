import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employer/Auth/login_employer.dart';
import 'package:overlay_support/overlay_support.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:helping_hand/Employee/Auth/employeeBase.dart';
// import 'package:helping_hand/Employer/Auth/employerBase.dart';
import 'package:provider/provider.dart';
import 'package:helping_hand/Model/user.dart';

class Base extends StatefulWidget {
  const Base({key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  StreamSubscription subscription;
  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen(showConnectivityResult);
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
  void showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    final message = hasInternet
        ? 'You are connected to Network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/base_background.jpg'),
                fit: BoxFit.fitHeight),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    "Who Are You?",
                    style: GoogleFonts.andada(
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 120.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 38,
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 150),
                                primary: Colors.green,
                                fixedSize: Size(140, 50),
                                elevation: 15,
                              ),
                              // onPressed: () async{
                              //   SharedPreferences.setMockInitialValues({});
                              //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                              //   preferences.setString(
                              //       'option','1' );
                              onPressed: () {
                                Provider.of<UserType>(context, listen: false)
                                    .setUserAsEmployer();

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginEmployer(),
                                  ),
                                );
                              },
                              child: Text(
                                'Employer',
                                style: GoogleFonts.scheherazade(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 38,
                              child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage('assets/images/avatar.png')),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 15,
                                side: BorderSide(width: 150),
                                primary: Colors.green,
                                fixedSize: Size(140, 50),
                              ),
                              // onPressed: () async{
                              //   SharedPreferences.setMockInitialValues({});
                              //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                              //   preferences.setString(
                              //       'option','2' );
                              onPressed: () {
                                Provider.of<UserType>(context, listen: false)
                                    .setUserAsEmployee();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginEmp(),
                                  ),
                                );
                              },
                              child: Text(
                                'Employee',
                                style: GoogleFonts.scheherazade(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    /* children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(40, 45)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => EmployerBase(),
                            ),
                          )
                        },
                        child: Text(
                          "Employer",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 19.0),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(40, 45)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EmployeeBase()),
                          )
                        },
                        child: Text(
                          "Employee",
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 19.0),
                        ),
                      ),
                    ],*/
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
