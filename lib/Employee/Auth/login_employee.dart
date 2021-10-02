import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Auth/signUp1.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/base.dart';
import 'package:helping_hand/resetpassword.dart';

void main() {
  runApp(login_employee());
}

// ignore: camel_case_types
class login_employee extends StatefulWidget {
  @override
  _login_employeeState createState() => _login_employeeState();
}

// ignore: camel_case_types
class _login_employeeState extends State<login_employee> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Base(),
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Login"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_hey_email_liaa.png",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: GoogleFonts.notoSans().fontFamily,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            labelText: 'Mobile Number',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                            labelText: 'Password',
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeHome()),
                        );
                      },
                      child: Text('Login')),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => resetpassword()),
                        );
                      },
                      child: Text('Forgot Password')),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont Have an account?"),
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
                              child: Text("Sign Up")),
                        ],
                      ),
                    ),
                  )

                  /*  Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: GoogleFonts.notoSans().fontFamily,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile Number',
                        labelText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeHome()),
                    );
                  },
                  child: Text('Login')),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => resetpassword()),
                    );
                  },
                  child: Text('Forgot Password')),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont Have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployeeSignUp()));
                        },
                        child: Text("Sign Up")),*/
                ],
              )),
            ],
          )),
        ),
      ),
    );
  }
}
