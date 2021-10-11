import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class JobOptions extends StatefulWidget {
  const JobOptions({key}) : super(key: key);

  @override
  _JobOptionsState createState() => _JobOptionsState();
}

class _JobOptionsState extends State<JobOptions> {
  // ignore: non_constant_identifier_names
  List<String> Jobs = [
    "Grocery",
    "Halwai",
    "Medical",
    "Restaurant",
    "Maid Service"
  ];
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Jobs.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                child: Padding(
                  padding: EdgeInsets.all(7.sp),
                  child: Card(
                    // elevation: 1.sp,
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: Text(
                          Jobs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
