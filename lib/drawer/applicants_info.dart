import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Employer/Home/Employee-Details/employee_detail.dart';
import 'package:helping_hand/screens/employee_profile_screen.dart';

class ApplicantsInfo extends StatefulWidget {
  // const ApplicantsInfo({Key? key}) : super(key: key);
  final String jobId;
  ApplicantsInfo(this.jobId);

  @override
  _ApplicantsInfoState createState() => _ApplicantsInfoState();
}

class _ApplicantsInfoState extends State<ApplicantsInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('jobs')
          .doc(widget.jobId)
          .collection('applicants')
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.teal,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final applicants = snapshot.data.docs;
        if (applicants.length == 0 ||
            applicants.isEmpty ||
            snapshot.data == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Applicants'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.teal,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/waiting.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No one has applied for the job !',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Applicants'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.teal,
          ),
          body: ListView.builder(
            itemCount: applicants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(4, 1, 4, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              EmployeeProfile(applicants[index]['applicantId']),
                        ),
                      );
                    },
                    title: Text(applicants[index]['applicantName']),
                    subtitle:
                        Text('Contact: +91 ' + applicants[index]['contact']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(applicants[index]['contact']),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('employeeProfile')
                                .doc(applicants[index]['applicantId'])
                                .get(),
                            builder: (context,
                                AsyncSnapshot<
                                        DocumentSnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Icon(Icons.info);
                              }
                              final userData = snapshot.data;
                              return IconButton(
                                key: Key(applicants[index]['applicantName']),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => EmployeeDetailScreen(
                                        result: userData,
                                      ),
                                    ),
                                  );
                                },
                                icon: FaIcon(FontAwesomeIcons.infoCircle),
                              );
                            }),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(applicants[index]['profileImage']),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
