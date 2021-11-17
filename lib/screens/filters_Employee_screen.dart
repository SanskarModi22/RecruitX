import 'package:flutter/material.dart';
import 'package:path/path.dart';

class EmployeeFilterScreen extends StatefulWidget {
  const EmployeeFilterScreen({Key key}) : super(key: key);

  @override
  _EmployeeFilterScreenState createState() => _EmployeeFilterScreenState();
}

class _EmployeeFilterScreenState extends State<EmployeeFilterScreen> {
  RangeValues _currentSalaryRangeValues = const RangeValues(0, 50000);
  bool _jobType = false;
  bool _nightShift = false;
  // job types
  bool _allJobs = true;
  bool _privateTutor = false;
  bool _peon = false;
  bool _driver = false;
  bool _securityGuard = false;
  bool _labour = false;
  bool _electrician = false;

  // cities
  bool _allCities = true;
  bool _mumbai = false;
  bool _delhi = false;
  bool _chennai = false;
  bool _kolkata = false;
  bool _lucknow = false;

  void _autoAllJobs() {
    if (_privateTutor == false &&
        _peon == false &&
        _driver == false &&
        _securityGuard == false &&
        _labour == false &&
        _electrician == false) {
      setState(() {
        _allJobs = true;
      });
    }
    if (_privateTutor == true ||
        _peon == true ||
        _driver == true ||
        _securityGuard == true ||
        _labour == true ||
        _electrician == true) {
      setState(() {
        _allJobs = false;
      });
    }
  }

  void _autoAllCities() {
    if (_chennai == false &&
        _kolkata == false &&
        _lucknow == false &&
        _mumbai == false &&
        _delhi == false) {
      setState(() {
        _allCities = true;
      });
    }
    if (_chennai == true ||
        _kolkata == true ||
        _lucknow == true ||
        _mumbai == true ||
        _delhi == true) {
      setState(() {
        _allCities = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Salary Range
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
              Divider(),
              // jobs
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Prefered Jobs'),
                subtitle: Text('Select your most prefered jobs'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5,
                  children: <Widget>[
                    CustomCheckBox(
                      jobText: "All Jobs",
                      checkbox: Checkbox(
                        value: _allJobs,
                        onChanged: (val) {
                          setState(() {
                            _allJobs = val;
                          });
                        },
                      ),
                    ),
                    Container(),
                    CustomCheckBox(
                      jobText: "Private Tutor",
                      checkbox: Checkbox(
                        value: _privateTutor,
                        onChanged: (val) {
                          setState(() {
                            _privateTutor = val;
                            _autoAllJobs();
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
                            _autoAllJobs();
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
                            _autoAllJobs();
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
                            _autoAllJobs();
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
                            _autoAllJobs();
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
                            _autoAllJobs();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Cities'),
                subtitle: Text('Select the cities to look for jobs. '),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5,
                  children: <Widget>[
                    CustomCheckBox(
                      jobText: "All Cities",
                      checkbox: Checkbox(
                        value: _allCities,
                        onChanged: (val) {
                          setState(() {
                            _allCities = val;
                          });
                        },
                      ),
                    ),
                    // Container(),
                    CustomCheckBox(
                      jobText: "Mumbai",
                      checkbox: Checkbox(
                        value: _mumbai,
                        onChanged: (val) {
                          setState(() {
                            _mumbai = val;
                            _autoAllCities();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Delhi",
                      checkbox: Checkbox(
                        value: _delhi,
                        onChanged: (val) {
                          setState(() {
                            _delhi = val;
                            _autoAllCities();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Chennai",
                      checkbox: Checkbox(
                        value: _chennai,
                        onChanged: (val) {
                          setState(() {
                            _chennai = val;
                            _autoAllCities();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Kolkata",
                      checkbox: Checkbox(
                        value: _kolkata,
                        onChanged: (val) {
                          setState(() {
                            _kolkata = val;
                            _autoAllCities();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Lucknow",
                      checkbox: Checkbox(
                        value: _lucknow,
                        onChanged: (val) {
                          setState(() {
                            _lucknow = val;
                            _autoAllCities();
                          });
                        },
                      ),
                    ),
                  ],
                ),
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
                    Navigator.of(context).pop();
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
