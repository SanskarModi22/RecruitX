import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Auth/signUp1.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Services/Authentication.dart';
import 'package:helping_hand/Shared/mobile_signUp.dart';
import 'package:helping_hand/Shared/resetpassword.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class LoginEmp extends StatefulWidget {
  @override
  _LoginEmpState createState() => _LoginEmpState();
}

// ignore: camel_case_types
class _LoginEmpState extends State<LoginEmp> {
  final AuthServices _auth = AuthServices();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formGlobalKey,
        child: Container(
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  18.w,
                  10.h,
                  10.w,
                  0,
                ),
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'RecruitX Welcomes You !',
                        textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Card(
                      color: Colors.black,
                      elevation: 10,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 55,
                            width: 300,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )),
                              onPressed: () {
                                // if (formGlobalKey.currentState.validate()) {
                                //   formGlobalKey.currentState.save();
                                // }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MobileSignUp()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.mobile,
                                    size: 35,
                                  ),
                                  Text(
                                    "SignUp with Mobile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 55,
                            width: 300,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )),
                              onPressed: () async {
                                final res = await _auth.signInWithGoogle();
                                if (res != null)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EmployeeHome()),
                                  );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/images/google-icon.png",
                                    width: 50,
                                    height: 40,
                                  ),
                                  Text(
                                    "SignUp with Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
                                    fontSize: 17,
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
                                                  EmployeeSignUp()));
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 17,
                                      ),
                                    )),
                              ],
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
