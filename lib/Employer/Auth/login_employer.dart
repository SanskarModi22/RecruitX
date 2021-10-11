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
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Form(
        key: formGlobalKey,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'data:image/jpeg;base64,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'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: GoogleFonts.notoSans().fontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Card(
                            color: Colors.black,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(25, 35, 25, 0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                          10,
                                        ),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                          10,
                                        ),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                          10,
                                        ),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(
                                          10,
                                        ),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                      ),
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      filled: true,
                                      hintText: 'Enter Mobile Number',
                                      labelText: 'Mobile Number',
                                    ),
                                    validator: (number) {
                                      if (number.length >= 10)
                                        return null;
                                      else
                                        return 'Enter a valid Number';
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(width: 150),
                                    primary: Colors.green,
                                    fixedSize: Size(400, 45),
                                  ),
                                  onPressed: () {
                                    if (formGlobalKey.currentState.validate()) {
                                      formGlobalKey.currentState.save();
                                    }
                                    /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmployeeHome()),
                                    );*/
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
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
                                      MaterialPageRoute(
                                          builder: (context) => EmployeeHome()),
                                    );
                                  },
                                  child: Text(
                                    'Signup with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                resetpassword()),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Dont Have an account?",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EmployerSignUp()));
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15,
                                            ),
                                          )),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
