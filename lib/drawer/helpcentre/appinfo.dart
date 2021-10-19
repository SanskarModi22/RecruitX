import 'package:flutter/material.dart';

// ignore: camel_case_types
class App_Info extends StatelessWidget {
  // const App_Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App info"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Recruit-X is an app which helps you get your dream job.\nThe app filters your resume according to your talent and skills and then gives you the best of jobs.\n",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Recruit-X is very user-friendly.The Technical team is there for you 25*7.",
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
