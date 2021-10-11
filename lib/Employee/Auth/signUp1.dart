import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employee/Home/Home.dart';

class EmployeeSignUp extends StatefulWidget {
  const EmployeeSignUp({key}) : super(key: key);

  @override
  _EmployeeSignUpState createState() => _EmployeeSignUpState();
}

class _EmployeeSignUpState extends State<EmployeeSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/undraw_hey_email_liaa.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("signup"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Username', labelText: 'Username'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Full Name', labelText: 'Full Name'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Phone Number', labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password', labelText: 'Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Address', labelText: 'Address'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 30,
                        width: 30,
                        child: Text(
                          "Age",
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: ''),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'City', labelText: 'City'),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'State', labelText: 'State'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Salary Expectations',
                      labelText: 'Salary Expectations'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: '  Description', labelText: ' Description'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Experience', labelText: 'Experience'),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeHome()));
                    },
                    child: Text("Sign up")),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginEmp()));
                          },
                          child: Text("Login")),
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
