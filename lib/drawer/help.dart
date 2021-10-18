import 'package:flutter/material.dart';
import 'package:helping_hand/helpcentre/appinfo.dart';
import 'package:helping_hand/helpcentre/contactus.dart';
import 'package:helping_hand/helpcentre/helpcentre.dart';
import 'package:helping_hand/helpcentre/termsandprivacy.dart';

void main() {
  runApp(help());
}

// ignore: camel_case_types
class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

// ignore: camel_case_types
class _helpState extends State<help> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Material(
      // debugShowCheckedModeBanner: false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.teal,
          title: Text(" Help"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Help_centre()));
                  },
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.green,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Help Centre"),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contact_us()));
                  },
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.people_alt_sharp,
                        color: Colors.green,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Contact us"),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Terms_Privacy()));
                  },
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        color: Colors.green,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Terms and Privacy Policy"),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => App_Info()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: Colors.green,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          ("App info"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
