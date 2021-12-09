import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Model/user.dart';


import 'package:helping_hand/Services/Authentication.dart';
import 'package:helping_hand/Shared/mobile_signUp.dart';
import 'package:helping_hand/wrapper.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class LoginEmployer extends StatefulWidget {
  bool isEmployer;

  LoginEmployer({this.isEmployer});

  _LoginEmployerState createState() => _LoginEmployerState();
}

// ignore: camel_case_types
class _LoginEmployerState extends State<LoginEmployer> {
      //   bool isEmployer;
      // bool isEmployee;

  final AuthServices _auth = AuthServices();
  final formGlobalKey = GlobalKey<FormState>();
        StreamSubscription subscription;
  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen(showConnectivityResult);
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
  void showConnectivityResult(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    print(hasInternet);
    final message = hasInternet
        ? 'You are connected to network'
        : 'You have no Internet';
    final colour = hasInternet ? Colors.green : Colors.red;
    showTopSnackbar(context, message, colour);
  }

  void showTopSnackbar(BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(message), background: color);
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formGlobalKey,
        child: Container(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  5.w,
                  10.h,
                  5.w,
                  0,
                ),
                child: Container(
                  width: 100.w,
                  // height: 10.h,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'RecruitX Welcomes You !',
                        textStyle: TextStyle(
                          color: Colors.orange,
                          fontSize: 6.4.w,
                          fontWeight: FontWeight.bold,
                        ),
                          textAlign: TextAlign.center
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Container(
                          height: 7.h,
                          width: 75.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(7.0),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                )
                            ),
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
                                  size: 8.7.w,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.isEmployer?"LogIn with Mobile":"SignUp with Mobile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 4.4.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.75.h,
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 4.6.w,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 3.75.h,
                        ),
                        Container(
                          height: 7.h,
                          width: 75.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(7.0),
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
                              // FirebaseFirestore.instance
                              //     .collection('employerProfile')
                              //     .doc(user.uid??"null")
                              //     .get()
                              //     .then((DocumentSnapshot documentSnapshot) {
                              //   if (documentSnapshot.exists) {
                              //     isEmployer = documentSnapshot['isEmployer'];
                              //     print(isEmployer);
                              //     print(user.uid);
                              //   }
                              // });

                              if (res != null)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper(),),
                                );
                            },
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/google-icon.png",
                                  width: 12.5.w,
                                  height: 5.h,
                                ),
                                Text(
                                  widget.isEmployer?"LogIn with Google":"SignUp with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 4.4.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        // Center(
                        //   child: Container(
                        //       child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         "Dont Have an account?",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 17,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       TextButton(
                        //           onPressed: () {
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         EmployerSignUp()));
                        //           },
                        //           child: Text(
                        //             "Sign Up",
                        //             style: TextStyle(
                        //               color: Colors.green,
                        //               fontSize: 17,
                        //             ),
                        //           )),
                        //     ],
                        //   )),
                        // ),
                      ],
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
