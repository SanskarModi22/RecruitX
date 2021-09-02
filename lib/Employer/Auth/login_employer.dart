import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Employer/Auth/SignUp2.dart';

import 'package:helping_hand/resetpassword.dart';

void main() {
  runApp(login_employer());
}

// ignore: camel_case_types
class login_employer extends StatefulWidget {
  @override
  _login_employerState createState() => _login_employerState();
}

// ignore: camel_case_types
class _login_employerState extends State<login_employer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          title: Text("login"),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_hey_email_liaa.png",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: GoogleFonts.notoSans().fontFamily,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile Number',
                        labelText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeHome()),
                    );
                  },
                  child: Text('Login')),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => resetpassword()),
                    );
                  },
                  child: Text('Forgot Password')),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont Have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployerSignUp()));
                        },
                        child: Text("Sign Up")),
                  ],
                )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
