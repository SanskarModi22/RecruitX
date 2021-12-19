import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../Services/Authentication.dart';
class MobileSignUp extends StatefulWidget {
  const MobileSignUp({Key key}) : super(key: key);

  @override
  _MobileSignUpState createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  final AuthServices _auth = AuthServices();
  TextEditingController _phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 27.5.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 35, 25, 0),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
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

                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Mobile Number',

                ),
                // validator: (number) {
                //   print(number);
                //   setState(() {
                //     _phoneController.text=number;
                //   });

                // },
              ),
            ),
            SizedBox(
              height: 3.75.h,
            ),
            Container(
              height: 6.875.h,
              width: 50.w,
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
                onPressed: () async{
                  print(_phoneController.text);
                  await _auth.loginUser("+91${_phoneController.text}", context);
                  // if (formGlobalKey.currentState.validate()) {
                  //   formGlobalKey.currentState.save();
                  // }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => MobileSignUp()),
                  // );
                },
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [

                    Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
