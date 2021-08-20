import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/resetpassword.dart';

// ignore: camel_case_types
class login_page extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _login_pageState createState() => _login_pageState();
}

// ignore: camel_case_types
class _login_pageState extends State<login_page> {
  var child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
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
                  child: Text('Forgot Password'))
            ],
          )),
        ),
      ),
    );
  }
}
