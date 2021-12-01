import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:sizer/sizer.dart';

class JobOptions extends StatefulWidget {
  const JobOptions({key}) : super(key: key);

  @override
  _JobOptionsState createState() => _JobOptionsState();
}

class _JobOptionsState extends State<JobOptions> {
  // ignore: non_constant_identifier_names
  List<String> Jobs = [
    "Driver",
    "Watchman",
    "Halwai",
    "Peon",
    "Tutor",
    "Labour",
    "Waiter",
    "Maid",
    "Security Guard",
    "Delivery Boy"
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
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobList(text: Jobs[index],),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.all(7.sp),
                  child: Card(
                    elevation: 0,
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
