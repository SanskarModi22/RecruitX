import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/employee_home.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';

class signup_page4 extends StatefulWidget {
  // const signup_page4({ Key? key }) : super(key: key);

  @override
  _signup_page4State createState() => _signup_page4State();
}

class _signup_page4State extends State<signup_page4> {
  @override
  bool peon = false;
  bool driver = false;
  bool tutor = false;
  bool securityguard = false;
  bool labour = false;
  bool halwai = false;
  bool watchman = false;
  bool maid = false;
  bool waiter = false;
  bool sweeper = false;
  int count = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Jobs, You might want:',
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            CustomCheckBox(
              jobText: "Peon",
              checkbox: Checkbox(
                value: peon,
                onChanged: (val) {
                  setState(() {
                    peon = val;
                    if (peon == true)
                      count++;
                    else if (peon == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "driver",
              checkbox: Checkbox(
                value: driver,
                onChanged: (val) {
                  setState(() {
                    driver = val;
                    if (driver == true)
                      count++;
                    else if (driver == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Private Tutor",
              checkbox: Checkbox(
                value: tutor,
                onChanged: (val) {
                  setState(() {
                    tutor = val;
                    if (tutor == true)
                      count++;
                    else if (tutor == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Security Gaurd",
              checkbox: Checkbox(
                value: securityguard,
                onChanged: (val) {
                  setState(() {
                    securityguard = val;
                    if (securityguard == true)
                      count++;
                    else if (securityguard == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Labour",
              checkbox: Checkbox(
                value: labour,
                onChanged: (val) {
                  setState(() {
                    labour = val;
                    if (labour == true)
                      count++;
                    else if (labour == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Halwai",
              checkbox: Checkbox(
                value: halwai,
                onChanged: (val) {
                  setState(() {
                    halwai = val;
                    if (halwai == true)
                      count++;
                    else if (halwai == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Watchman",
              checkbox: Checkbox(
                value: watchman,
                onChanged: (val) {
                  setState(() {
                    watchman = val;
                    if (watchman == true)
                      count++;
                    else if (watchman == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "HouseMaid",
              checkbox: Checkbox(
                value: maid,
                onChanged: (val) {
                  setState(() {
                    maid = val;
                    if (maid == true)
                      count++;
                    else if (maid == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Waiter",
              checkbox: Checkbox(
                value: waiter,
                onChanged: (val) {
                  setState(() {
                    waiter = val;
                    if (waiter == true)
                      count++;
                    else if (waiter == false) count--;
                  });
                },
              ),
            ),
            CustomCheckBox(
              jobText: "Sweeper",
              checkbox: Checkbox(
                value: sweeper,
                onChanged: (val) {
                  setState(() {
                    sweeper = val;
                    if (sweeper == true)
                      count++;
                    else if (sweeper == false) count--;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(width: 150),
                primary: Colors.green,
                fixedSize: Size(400, 45),
              ),
              onPressed: () {
                if (count == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please choose atleast one job')),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmployeeHome()),
                  );
                }
              },
              child: Text(
                'Signup',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
