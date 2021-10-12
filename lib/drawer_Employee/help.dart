import 'package:flutter/material.dart';

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
                  onTap: () {},
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Help Centre"),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.people_alt_sharp,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Contact us"),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        ("Terms and Privacy Policy"),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.info_rounded,
                      color: Colors.blue,
                    ),
                    title: Text(
                      ("App info"),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
