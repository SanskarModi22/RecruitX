import 'package:flutter/material.dart';
import 'package:helping_hand/Employer/Auth/login_employer.dart';
import 'package:helping_hand/Employer/Home/Home.dart';

class EmployerSignUp extends StatefulWidget {
  const EmployerSignUp({key}) : super(key: key);

  @override
  _EmployerSignUpState createState() => _EmployerSignUpState();
}

class _EmployerSignUpState extends State<EmployerSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/undraw_hey_email_liaa.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("signup"),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Shop/Company name',
                      labelText: 'Shop/Company name'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Owner name', labelText: 'Owner name'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Phone Number', labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password', labelText: 'Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text('Authentication proof and shop photo'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Shop Address', labelText: 'Shop Address'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'City', labelText: 'City'),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'State', labelText: 'State'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Working Hours', labelText: 'Working Hours'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: ' Shop Description',
                      labelText: 'Shop Description'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text("License Photo"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployerHome()));
                    },
                    child: Text("Sign up")),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginEmployer()));
                          },
                          child: Text("Login")),
                    ],
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
