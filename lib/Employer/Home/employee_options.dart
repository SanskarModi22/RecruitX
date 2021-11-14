import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:helping_hand/Employer/Home/Employee-Details/employee_list.dart';
import 'package:sizer/sizer.dart';

class EmployeeOptions extends StatefulWidget {
  const EmployeeOptions({key}) : super(key: key);

  @override
  _EmployeeOptionsState createState() => _EmployeeOptionsState();
}

class _EmployeeOptionsState extends State<EmployeeOptions> {
  // ignore: non_constant_identifier_names
  List<String> employeeFields = [
    "Grocery",
    "Watchmen",
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
            itemCount: employeeFields.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeList(text: employeeFields[index],),
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
                          employeeFields[index],
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
