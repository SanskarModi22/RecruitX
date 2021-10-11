import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Model/user.dart';
class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser userfromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => userfromFirebase(user));
  }
  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) async{
        },
        verificationFailed: (FirebaseAuthException  exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
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
                    FlatButton( child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                    onPressed: (){
                      Navigator.pop(context);
                    },),
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth.signInWithCredential(credential);

                        User user = result.user;
                        userfromFirebase(user);
                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EmployeeHome()
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }
}