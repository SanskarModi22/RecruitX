import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup3.dart';

// ignore: camel_case_types
class signup_page2 extends StatefulWidget {
  // const signup_page2({ Key? key }) : super(key: key);
  final String address;
  final String EmployeeName;
  final String EmployeeAge;
  final String contact;
  final File imgUrl;

  const signup_page2(
      {Key key,
      this.address,
      this.EmployeeName,
      this.EmployeeAge,
      this.contact, this.imgUrl})
      : super(key: key);
  @override
  _signup_page2State createState() => _signup_page2State();
}

// ignore: camel_case_types
class _signup_page2State extends State<signup_page2> {
  @override
  final _formkey2 = GlobalKey<FormState>();
  final dob = TextEditingController();
  final Bio = TextEditingController();
  final Aadhar = TextEditingController();
  final SalaryExpextation = TextEditingController();
  final ExpectedJobs = TextEditingController();
  final Experience = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dob.dispose();
    Bio.dispose();
    Aadhar.dispose();
    SalaryExpextation.dispose();
    ExpectedJobs.dispose();
    Experience.dispose();
    super.dispose();
  }

  clearText() {
    dob.clear();
    Bio.clear();
    Aadhar.clear();
    SalaryExpextation.clear();
    ExpectedJobs.clear();
    Experience.clear();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formkey2,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: dob,
                    decoration: InputDecoration(
                      // floatingLabelBehavior: FloatingLabelBehavior.always,

                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      //  hintText: 'Owner name',
                      labelText: 'DOB(DD/MM/YYYY)',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length <= 6) {
                        return 'Please enter valid DOB';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: Bio,
                    minLines: 2,
                    maxLines: null,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Bio',
                      // labelText: ' Description',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your valid data';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: Aadhar,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Aadhar',
                      //  labelText: 'Salary Expectations',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length >= 13) {
                        return 'Please enter your AADHAR number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Salary Expectation:",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 90,
                        child: TextFormField(
                          // controller: Aadhar,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                            hintText: 'Min',
                            //  labelText: 'Salary Expectations',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "To",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 90,
                        child: TextFormField(
                          //  controller: Aadhar,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                            hintText: 'Max',
                            //  labelText: 'Salary Expectations',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*required';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: Experience,
                    minLines: 2,
                    maxLines: null,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Experience',
                      labelText: 'Experience',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your experience';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: ExpectedJobs,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Expected Jobs',
                      // labelText: 'Salary Expectations',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid data';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
<<<<<<< HEAD
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 150),
                      primary: Colors.green,
                      fixedSize: Size(400, 45),
                    ),
                    onPressed: () {
                      if (_formkey2.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_page3(
                                    EmployeeName: widget.EmployeeName,
                                    EmployeeAge: widget.EmployeeAge,
                                    address: widget.address,
                                    contact: widget.contact,
                                    Aadhar: Aadhar.text,
                                    Bio: Bio.text,
                                    dob: dob.text,
                                    Experience: Experience.text,
                                    SalaryExpextation: SalaryExpextation.text,
                                    ExpectedJobs: ExpectedJobs.text,
                                  )),
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                      ),
=======
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => signup_page3(
                            imgUrl: widget.imgUrl,
                                EmployeeName: widget.EmployeeName,
                                EmployeeAge: widget.EmployeeAge,
                                address: widget.address,
                                contact: widget.contact,
                                Aadhar: Aadhar.text,
                                Bio: Bio.text,
                                dob: dob.text,
                                Experience: Experience.text,
                                SalaryExpextation: SalaryExpextation.text,
                                ExpectedJobs: ExpectedJobs.text

                              )),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
>>>>>>> 5a7fd007ee67810bf161cc7ca0e8c0c0372bb11e
                    ),
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
