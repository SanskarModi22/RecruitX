import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:helping_hand/Employer/Home/employer_filter_screen.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';
import 'package:sizer/sizer.dart';

class EmployerFilterButton extends StatefulWidget {
  const EmployerFilterButton(
      {key, this.height, this.margin, @required this.text})
      : super(key: key);
  final double height;
  final double margin;
  final String text;
  @override
  _EmployerFilterButtonState createState() => _EmployerFilterButtonState();
}

class _EmployerFilterButtonState extends State<EmployerFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(widget.margin ?? 8),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.sp),
              )),
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EmployerFilterScreen(
                  text: widget.text,
                ),
              ),
            );
          },
          child: Container(
            child: Image.asset(
              "assets/images/filter.png",
              height: widget.height ?? 4.h,
              fit: BoxFit.fill,
              color: Colors.blue,
            ),
          ),
        ));
  }
}
