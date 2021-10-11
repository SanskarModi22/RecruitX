import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MobileSignUp extends StatefulWidget {
  const MobileSignUp({Key key}) : super(key: key);

  @override
  _MobileSignUpState createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 220,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 35, 25, 0),
              child: TextFormField(
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
                validator: (number) {
                  if (number.length >= 10)
                    return null;
                  else
                    return 'Enter a valid Number';
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              width: 200,
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

                    Text(
                      "Verify OTP",
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
          ],
        ),
      ),
    );
  }
}
