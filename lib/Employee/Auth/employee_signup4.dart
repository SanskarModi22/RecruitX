import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup3.dart';
import 'package:helping_hand/Employee/Home/employee_home.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';
import 'package:sizer/sizer.dart';

class signup_page4 extends StatefulWidget {
  // const signup_page4({ Key? key }) : super(key: key);
  final String address;
  final String EmployeeName;
  final String EmployeeAge;
  final String contact;
  final String dob;
  final String Bio;
  final String Aadhar;

final int minSal;
final int maxSal;
  final String ImgUrl;
  final String Experience;

  const signup_page4({Key key, this.address, this.EmployeeName, this.EmployeeAge, this.contact, this.dob, this.Bio, this.Aadhar, this.ImgUrl, this.Experience, this.minSal, this.maxSal}) : super(key: key);
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
  bool deliveryBoy = false;
  int count = 0;
  var result ;
  List<String> temp =[];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Jobs, You might want:',
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Peon',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Driver',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Private Tutor',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Security Guard',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Labour',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Watchman',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Maid',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
                            value: waiter,
                            onChanged: (val) {
                              setState(() {
                                waiter = val;
                                if (driver == true)
                                  count++;
                                else if (waiter == false) count--;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Waiter',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
                            value: deliveryBoy,
                            onChanged: (val) {
                              setState(() {
                                deliveryBoy = val;
                                if (deliveryBoy == true)
                                  count++;
                                else if (deliveryBoy == false) count--;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Delivery Boy',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.green),
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
                        Text(
                          'Halwai',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

               ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.green),
                   fixedSize: MaterialStateProperty.all(Size(400,50)),
                 ),
                onPressed: () async {
                  // bool peon = false;
                  // bool driver = false;
                  // bool tutor = false;
                  // bool securityguard = false;
                  // bool labour = false;
                  // bool halwai = false;
                  // bool watchman = false;
                  // bool maid = false;
                  // bool waiter = false;
                  // bool sweeper = false;
                  if (count == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please choose atleast one job')),
                    );
                  } else {
                    final user = await FirebaseAuth.instance.currentUser;
                    if(driver==true)
                      temp.add("Driver");
                    if(halwai==true)
                      temp.add("Halwai");
                    if(peon==true)
                      temp.add("Peon");
                    if(tutor==true)
                      temp.add("Tutor");
                    if(securityguard==true)
                      temp.add("Security Guard");
                    if(labour==true)
                      temp.add("Labour");
                    if(waiter==true)
                      temp.add("Waiter");
                    if(maid==true)
                      temp.add("Maid");
                    if(watchman==true)
                      temp.add("Watchman");
                    if(deliveryBoy==true)
                      temp.add("Delivery Boy");
                    result=temp.toList();
                    DatabaseServices(uid: user.uid).updateEmployeeData(
                      employeeExpectedJobs: result,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup_page3(
                        Aadhar: widget.Aadhar,
                        dob: widget.dob,
                        EmployeeName: widget.EmployeeName,
                        Bio: widget.Bio,
                        EmployeeAge: widget.EmployeeAge,
                        contact: widget.contact,
                        address: widget.address,
                        Experience: widget.Experience,
                       minSal: widget.minSal,
                        maxSal: widget.maxSal,
                        ImgUrl: widget.ImgUrl,
                        ExpectedJobs: result,
                      )),
                    );
                  }
                },
                child: Text(
                  'Next',
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
