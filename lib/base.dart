import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'data:image/jpeg;base64,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',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Text(
                      "Who Are You?",
                      style: GoogleFonts.andada(
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    'data:image/jpeg;base64,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',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(width: 150),
                                  primary: Colors.green,
                                  fixedSize: Size(140, 50),
                                  elevation: 15,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EmployerBase(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Employer',
                                  style: GoogleFonts.scheherazade(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    'data:image/jpeg;base64,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',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  side: BorderSide(width: 150),
                                  primary: Colors.green,
                                  fixedSize: Size(140, 50),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EmployeeBase(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Employee',
                                  style: GoogleFonts.scheherazade(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      /* children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(40, 45)),
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
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 19.0),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(40, 45)),
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
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 19.0),
                          ),
                        ),
                      ],*/
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    GestureDetector(
                      child: Text(
                        "Want to change the language?",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
