import 'package:flutter/material.dart';

class EmployeeFilterScreen extends StatefulWidget {
  const EmployeeFilterScreen({Key key}) : super(key: key);

  @override
  _EmployeeFilterScreenState createState() => _EmployeeFilterScreenState();
}

class _EmployeeFilterScreenState extends State<EmployeeFilterScreen> {
  RangeValues _currentSalaryRangeValues = const RangeValues(10000, 25000);
  bool _jobType = false;
  bool _nightShift = false;
  bool _all = true;
  bool _privateTutor = false;
  bool _peon = false;
  bool _driver = false;
  bool _securityGuard = false;
  bool _labour = false;
  bool _electrician = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.attach_money_outlined,
                color: Colors.blue,
              ),
              subtitle: Text('Select the Range of salary'),
              title: Text(
                'Salary',
                style: TextStyle(fontSize: 18),
              ),
            ),
            RangeSlider(
              values: _currentSalaryRangeValues,
              min: 0,
              max: 50000,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentSalaryRangeValues = values;
                });
              },
              divisions: 10,
              labels: RangeLabels(
                _currentSalaryRangeValues.start.round().toString(),
                _currentSalaryRangeValues.end.round().toString(),
              ),
            ),
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
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Prefered Jobs'),
              subtitle: Text('Select your most prefered jobs'),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.spaceBetween,
              spacing: 5,
              children: <Widget>[
                CustomCheckBox(
                  jobText: "All Jobs",
                  checkbox: Checkbox(
                    value: _all,
                    onChanged: (val) {
                      setState(() {
                        _all = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Private Tutor",
                  checkbox: Checkbox(
                    value: _privateTutor,
                    onChanged: (val) {
                      setState(() {
                        _privateTutor = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Peon",
                  checkbox: Checkbox(
                    value: _peon,
                    onChanged: (val) {
                      setState(() {
                        _peon = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Driver",
                  checkbox: Checkbox(
                    value: _driver,
                    onChanged: (val) {
                      setState(() {
                        _driver = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Security Guard",
                  checkbox: Checkbox(
                    value: _securityGuard,
                    onChanged: (val) {
                      setState(() {
                        _securityGuard = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Labour",
                  checkbox: Checkbox(
                    value: _labour,
                    onChanged: (val) {
                      setState(() {
                        _labour = val;
                      });
                    },
                  ),
                ),
                CustomCheckBox(
                  jobText: "Electrician",
                  checkbox: Checkbox(
                    value: _electrician,
                    onChanged: (val) {
                      setState(() {
                        _electrician = val;
                      });
                    },
                  ),
                ),
              ],
            )
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
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.checkbox,
        Text(widget.jobText),
      ],
    );
  }
}
