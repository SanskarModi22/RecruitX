
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/employee_home.dart';
import 'package:helping_hand/Employer/Home/Employee-Details/employee_list.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';

class EmployerFilterScreen extends StatefulWidget {
  const EmployerFilterScreen({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
  @override
  _EmployerFilterScreenState createState() => _EmployerFilterScreenState();
}

class _EmployerFilterScreenState extends State<EmployerFilterScreen> {
  double salary;

  bool _jobType;
  bool _nightShift;

  @override
  Widget build(BuildContext context) {
    if (salary == null) {
      salary = 100000;
    }
    // night shift
    if (_nightShift == null) {
      _nightShift = false;
    }
    if (_jobType == null) {
      _jobType = true;
    }
    void applyFilters() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => EmployeeList(
            text: widget.text,
            salary: salary,
            partTime: _jobType,
            nightShift: _nightShift,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Salary Range
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.blue,
                  ),
                  subtitle: Text('Select the Range of salary'),
                  title: Text(
                    'Salary',
                    style: TextStyle(fontSize: 13.8.sp),
                  ),
                ),
                Slider(
                    label: salary.toString(),
                    max: 100000,
                    min: 0,
                    divisions: 10,
                    value: salary,
                    onChanged: (val) {
                      setState(() {
                        salary = val;
                      });
                    }),
                // Job type
                ListTile(
                  leading: Icon(
                    _jobType ? Icons.hourglass_full : Icons.hourglass_bottom,
                    // color: Colors.blue,
                  ),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: _jobType ? Text('Full-Time') : Text('Part-Time'),
                  trailing: Switch(
                    value: _jobType,
                    onChanged: (val) {
                      setState(() {
                        _jobType = val;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    _nightShift ? Icons.nightlight : Icons.wb_sunny,
                    // color: Colors.blue,
                  ),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: _nightShift ? Text('Night-Shift') : Text('Day-Shift'),
                  trailing: Switch(
                    value: _nightShift,
                    onChanged: (val) {
                      setState(() {
                        _nightShift = val;
                      });
                    },
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  applyFilters();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  // const CustomCheckBox({ Key? key }) : super(key: key);
  final String jobText;
  final Checkbox checkbox;
  CustomCheckBox({this.checkbox, this.jobText});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.checkbox,
          Text(widget.jobText),
        ],
      ),
    );
  }
}
