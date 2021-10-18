import 'package:flutter/material.dart';

// ignore: camel_case_types
class Help_centre extends StatelessWidget {
  // const Help_centre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Centre"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "The Technical Team of Recruit-X is there for you 24*7.\n\nNeed help in:\n1. Posting a Job?\n2. Applying for a Job\n3. Posting a Resume.\n4. Searching a Job.\n\nContact us anytime.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
