import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class EmpPref extends StatelessWidget {
  EmpPref({Key key}) : super(key: key);

  @override
  List<String> Pref = ["Driving", "Washing", "Maid"];
  List<String> Job = ["23","24","32"];
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.transparent,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp)),
                  leading: CircleAvatar(
                    radius: 15.sp,
                    child: Icon(icons[index]),
                  ),
                  title: Text(
                    Pref[index],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Padding(
                    padding:  EdgeInsets.all(5.sp),
                    child: Text(
                      "${Job[index]} jobs availaible",
                      style: TextStyle(
                          fontSize: 12.sp,

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
