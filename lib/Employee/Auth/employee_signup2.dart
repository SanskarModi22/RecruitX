
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'employee_signup4.dart';

// ignore: camel_case_types
class signup_page2 extends StatefulWidget {
  // const signup_page2({ Key? key }) : super(key: key);
  final String address;
  final String employeeName;
  final String employeeAge;
  final String contact;
  final String imgUrl;

  const signup_page2(
      {Key key,
      this.address,
      this.employeeName,
      this.employeeAge,
      this.contact,
      this.imgUrl})
      : super(key: key);
  @override
  _signup_page2State createState() => _signup_page2State();
}

// ignore: camel_case_types
class _signup_page2State extends State<signup_page2> {
  @override
  final _formkey2 = GlobalKey<FormState>();
  final dob = TextEditingController();
  final bio = TextEditingController();
  final aadhar = TextEditingController();
  final salaryExpectation = TextEditingController();
  final ExpectedJobs = TextEditingController();
  final experience = TextEditingController();
  final minSal = TextEditingController();
  final maxSal = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dob.dispose();
    bio.dispose();
    aadhar.dispose();
    salaryExpectation.dispose();
    ExpectedJobs.dispose();
    experience.dispose();
    minSal.dispose();
    maxSal.dispose();
    super.dispose();
  }

  clearText() {
    dob.clear();
    bio.clear();
    aadhar.clear();
    salaryExpectation.clear();
    ExpectedJobs.clear();
    experience.clear();
  }

  DateTime _dateTime;

  Widget build(BuildContext context) {
    print(widget.imgUrl);
    return Form(
      key: _formkey2,
      child: Scaffold(
        backgroundColor: Colors.black,
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
                  Container(  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
            ),
                    height: 50,
                    width: 200,

                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _dateTime == null
                            ? 'Enter your DOB'
                            : DateFormat.yMMMd().format(_dateTime),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        fixedSize: MaterialStateProperty.all(Size(200,50)),
                      ),
                      onPressed: () {
                        showDatePicker(
                                initialDatePickerMode: DatePickerMode.day,
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2024))
                            .then((value) {
                          setState(() {
                            _dateTime = value;
                          });
                        });
                      },
                      child: Text('pick a date',style: TextStyle(fontSize: 16),)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: bio,
                    minLines: 2,
                    maxLines: null,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Write about yourself',
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
                    controller: aadhar,
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
                          value.isEmpty ) {
                        return 'Required*';
                      }
                      if(RegExp(r"^[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}$").hasMatch(value)==false)
                        return 'Enter valid Aadhar number';
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
                          controller: minSal,

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
                           controller: maxSal,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                            hintText: 'Max(<30,000)',
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
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(20),
                    ],
                    controller: experience,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Experience eg:5 years,3 years ,etc',

                      // labelText: 'Experience',
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
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(400,50)),
                    ),
                    onPressed: () {
                      if (_formkey2.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_page4(
                                    EmployeeName: widget.employeeName,
                                    EmployeeAge: widget.employeeAge,
                                    address: widget.address,
                                    contact: widget.contact,
                                    Aadhar: aadhar.text,
                                    Bio: bio.text,
                                    dob: DateFormat.yMMMd().format(_dateTime),
                                    Experience: experience.text,
                                    minSal: int.parse(minSal.text),
                                maxSal: int.parse(maxSal.text),
                                ImgUrl: widget.imgUrl,
                                  ),),
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                      ),

                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => signup_page3(
                      //           imgUrl: widget.imgUrl,
                      //               EmployeeName: widget.EmployeeName,
                      //               EmployeeAge: widget.EmployeeAge,
                      //               address: widget.address,
                      //               contact: widget.contact,
                      //               Aadhar: Aadhar.text,
                      //               Bio: Bio.text,
                      //               dob: dob.text,
                      //               Experience: Experience.text,
                      //               SalaryExpextation: SalaryExpextation.text,
                      //               ExpectedJobs: ExpectedJobs.text
                      //
                      //             )),
                      //   );
                      // },
                      // child: Text(
                      //   'Next',
                      //   style: TextStyle(
                      //     fontSize: 18,
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
