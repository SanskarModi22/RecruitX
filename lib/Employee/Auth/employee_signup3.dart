import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup2.dart';
import 'package:helping_hand/Employee/Home/Home.dart';

// ignore: camel_case_types
class signup_page3 extends StatefulWidget {
  // const signup_page2({ Key? key }) : super(key: key);

  @override
  _signup_page3State createState() => _signup_page3State();
}

// ignore: camel_case_types
class _signup_page3State extends State<signup_page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
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
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
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
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeHome()),
                    );
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
    );
  }
}
