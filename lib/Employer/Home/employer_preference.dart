import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class EmployerEmployeePreference extends StatelessWidget {
  EmployerEmployeePreference({Key key}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<String> Pref = ["Driving", "Washing", "Maid"];
  // ignore: non_constant_identifier_names
  List<String> Job = ["23", "24", "32"];
  List<IconData> icons = [
    Icons.drive_eta_rounded,
    FontAwesomeIcons.tshirt,
    FontAwesomeIcons.broom,
  ];
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Pref.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding:  EdgeInsets.all(1.9.w),
              child: Card(
                shadowColor: Colors.transparent,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.875.w)),
                  leading: CircleAvatar(
                    radius: 4.875.w,
                    child: Icon(icons[index]),
                  ),
                  title: Text(
                    Pref[index],
                    style:
                    TextStyle(fontSize: 4.875.w, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(1.6.w),
                    child: Text(
                      "${Job[index]} jobs availaible",
                      style: TextStyle(
                        fontSize: 3.9.w,
                      ),
                    ),
                  ),
                  trailing: Icon(FontAwesomeIcons.arrowRight),
                ),
              ),
            );
          }),
    );
  }
}
