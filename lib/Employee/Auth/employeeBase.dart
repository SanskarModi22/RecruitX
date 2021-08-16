import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/signUp.dart';
import 'package:helping_hand/Employee/Home/Home.dart';

class EmployeeBase extends StatefulWidget {
  const EmployeeBase({key}) : super(key: key);

  @override
  _EmployeeBaseState createState() => _EmployeeBaseState();
}

class _EmployeeBaseState extends State<EmployeeBase> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text("Choice"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Text(
                  "Want To SignUp or Login",
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(40, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmployeeSignUp(),
                          ),
                        )
                      },
                      child: Text(
                        "SignUp",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 19.0),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(40, 45)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => EmployeeHome(),
                          ),
                        )
                      },
                      child: Text(
                        "LogIn",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 19.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250.0,
                ),
                GestureDetector(
                  child: Text(
                    "Want to change the language?",
                    style: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.w900),
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
