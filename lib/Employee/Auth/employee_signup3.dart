

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup2.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class signup_page3 extends StatefulWidget {
  // const signup_page2({ Key? key }) : super(key: key);
  final String address;
  final String EmployeeName;
  final String EmployeeAge;
  final String contact;
  final String dob;
  final String Bio;
  final String Aadhar;
  final String SalaryExpextation;
  final String ExpectedJobs;
<<<<<<< HEAD
  final String Experience;

  const signup_page3(
      {Key key,
      this.address,
      this.EmployeeName,
      this.EmployeeAge,
      this.contact,
      this.dob,
      this.Bio,
      this.Aadhar,
      this.SalaryExpextation,
      this.ExpectedJobs,
      this.Experience})
      : super(key: key);
=======
  final String Experience ;
  final File imgUrl;

  const signup_page3({Key key, this.address, this.EmployeeName, this.EmployeeAge, this.contact, this.dob, this.Bio, this.Aadhar, this.SalaryExpextation, this.ExpectedJobs, this.Experience, this.imgUrl}) : super(key: key);
>>>>>>> 5a7fd007ee67810bf161cc7ca0e8c0c0372bb11e
  @override
  _signup_page3State createState() => _signup_page3State();
}

// ignore: camel_case_types
class _signup_page3State extends State<signup_page3> {
  @override
  final _formkey3 = GlobalKey<FormState>();
  final currentlyWorking = TextEditingController();
  final PrefereedJob = TextEditingController();
  final PreferredWork = TextEditingController();
  final Rating = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    currentlyWorking.dispose();
    PrefereedJob.dispose();
    PreferredWork.dispose();
    Rating.dispose();

    super.dispose();
  }

  clearText() {
    currentlyWorking.clear();
    PrefereedJob.clear();
    PreferredWork.clear();
    Rating.clear();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return Form(
      key: _formkey3,
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: currentlyWorking,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Currently working at:',
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
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: PrefereedJob,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Preferred job type',
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
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: PreferredWork,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Preferred work shift',
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
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: Rating,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Rating',
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
                      if (_formkey3.currentState.validate()) {
                        DatabaseServices(uid: user.uid).updateEmployeeData(
                            aadhar: widget.Aadhar,
                            isEmployee:
                                Provider.of<UserType>(context, listen: false)
                                    .userAsEmployee,
                            employeeDOB: widget.dob,
                            employeeName: widget.EmployeeName,
                            employeeBio: widget.Bio,
                            employeeAge: widget.EmployeeAge,
                            employeeContactNumber: widget.contact,
                            preferredJobType: PrefereedJob.text,
                            employeeAddress: widget.address,
                            employeeExperience: widget.Experience,
                            employeeExpectedSalary: widget.SalaryExpextation,
                            currentlyWorkingAt: currentlyWorking.text,
                            employeeExpectedJobs: PrefereedJob.text);
                        clearText();
=======
                  onPressed: ()  {
                      DatabaseServices(uid:user.uid ).updateEmployeeData(
                        aadhar: widget.Aadhar,
                        isEmployee: Provider.of<UserType>(context, listen: false)
                            .userAsEmployee,
                        employeeDOB: widget.dob,
                        employeeName: widget.EmployeeName,
                        employeeBio: widget.Bio,
                        employeeAge: widget.EmployeeAge,
                        employeeContactNumber: widget.contact,
                        preferredJobType: PrefereedJob.text,
                        employeeAddress: widget.address,
                        employeeExperience: widget.Experience,
                        employeeExpectedSalary: widget.SalaryExpextation,
                        currentlyWorkingAt: currentlyWorking.text,
                        employeeExpectedJobs: PrefereedJob.text,
                        imgUrl: widget.imgUrl,

                  );
                      clearText();
>>>>>>> 5a7fd007ee67810bf161cc7ca0e8c0c0372bb11e

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeHome()),
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
                  SizedBox(
                    height: 500,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
