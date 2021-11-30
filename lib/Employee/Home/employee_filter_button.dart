import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:helping_hand/screens/filters_Employee_screen.dart';
import 'package:sizer/sizer.dart';

class EmployeeFilterButton extends StatefulWidget {
  const EmployeeFilterButton({key, this.height, this.margin}) : super(key: key);
  final double height;
  final double margin;
  @override
  _EmployeeFilterButtonState createState() => _EmployeeFilterButtonState();
}

class _EmployeeFilterButtonState extends State<EmployeeFilterButton> {
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
                builder: (context) => EmployeeFilterScreen(),
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
