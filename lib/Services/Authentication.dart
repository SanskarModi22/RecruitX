import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helping_hand/Employee/Auth/employee_signup1.dart';
import 'package:helping_hand/Employer/Auth/employer_signup1.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:provider/provider.dart';


import '../wrapper.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user) => userfromFirebase(user));
  }



  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;
      userfromFirebase(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: missing_return
  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          final _codeController = TextEditingController();
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text("Cancel"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);

                        UserCredential result =
                            await _auth.signInWithCredential(credential);

                        User user = result.user;
                        userfromFirebase(user);

                        if(user != null){
                          // if(Provider.of<UserType>(context, listen: false)
                          //     .userAsEmployer){
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => EmployerSignUp()
                          // ));}
                          // else {
                          //   Navigator.push(context, MaterialPageRoute(
                          //       builder: (context) => EmployeeSignUp()
                          //   ));
                          Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Wrapper()
                ));
                          }
                        else{

                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }
}
