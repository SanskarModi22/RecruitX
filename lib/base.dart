import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employeeBase.dart';
import 'package:helping_hand/Employer/Auth/employerBase.dart';

class Base extends StatefulWidget {
  const Base({key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
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
                  "Who Are You?",
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
                            builder: (BuildContext context) => EmployerBase(),
                          ),
                        )
                      },
                      child: Text(
                        "Employer",
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
                              builder: (BuildContext context) =>
                                  EmployeeBase()),
                        )
                      },
                      child: Text(
                        "Employee",
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
