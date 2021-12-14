import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Shared/loader.dart';
import 'package:path/path.dart';

class EmployeeFilterScreen extends StatefulWidget {
  const EmployeeFilterScreen({Key key}) : super(key: key);

  @override
  _EmployeeFilterScreenState createState() => _EmployeeFilterScreenState();
}

class _EmployeeFilterScreenState extends State<EmployeeFilterScreen> {
  @override
  Widget build(BuildContext context) {
    final cuid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('employeeProfile')
          .doc(cuid)
          .snapshots(),
      builder: (ctx,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ColorLoader3();
        }
        final userData = snapshot.data;
        final List expectedJobs = userData['expectedJobs'];
        final bool allJobs = expectedJobs.isEmpty;
        final List preferredCities = userData['preferredCities'];
        final bool allCities = preferredCities.isEmpty;
        return _Body(
          maxVal: userData['maxExpSalary'],
          minVal: userData['minExpSalary'],
          jobType: userData['jobType'].toString() == 'Full-Time' ? true : false,
          nightShift: userData['preferredShift'].toString() == 'Night Shift'
              ? true
              : false,
          // jobs
          peon: expectedJobs.contains('Peon'),
          privateTutor: expectedJobs.contains('Tutor'),
          driver: expectedJobs.contains('Driver'),
          securityGuard: expectedJobs.contains('Security Guard'),
          labour: expectedJobs.contains('Labour'),
          halwai: expectedJobs.contains('Halwai'),
          waiter: expectedJobs.contains('Waiter'),
          watchmen: expectedJobs.contains('Watchman'),
          deliveryBoy: expectedJobs.contains('Delivery Boy'),
          maid: expectedJobs.contains('Maid'),
          allJobs: allJobs,
          // cities
          allCities: allCities,
          mumbai: preferredCities.contains('Mumbai'),
          delhi: preferredCities.contains('Delhi'),
          lucknow: preferredCities.contains('Lucknow'),
          chennai: preferredCities.contains('Chennai'),
          kolkata: preferredCities.contains('Kolkata'),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  // const _Body({ Key? key }) : super(key: key);
  final num minVal;
  final num maxVal;
  bool jobType;
  bool nightShift;
  // job types
  bool allJobs;
  bool privateTutor;
  bool peon;
  bool driver;
  bool securityGuard;
  bool labour;
  bool halwai;
  bool watchmen;
  bool deliveryBoy;
  bool waiter;
  bool maid;
  // cities
  bool allCities;
  bool mumbai;
  bool delhi;
  bool chennai;
  bool kolkata;
  bool lucknow;
  _Body({
    @required this.maxVal,
    @required this.minVal,
    @required this.allCities,
    @required this.allJobs,
    @required this.chennai,
    @required this.delhi,
    @required this.driver,
    @required this.halwai,
    @required this.jobType,
    @required this.kolkata,
    @required this.labour,
    @required this.lucknow,
    @required this.maid,
    @required this.mumbai,
    @required this.nightShift,
    @required this.peon,
    @required this.privateTutor,
    @required this.securityGuard,
    @required this.deliveryBoy,
    @required this.waiter,
    @required this.watchmen,
  });
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  num xminVal;
  num xmaxVal;

  RangeValues _currentSalaryRangeValues;

  bool _jobType;
  bool _nightShift;
  // job types
  bool _allJobs;
  bool _privateTutor;
  bool _peon;
  bool _driver;
  bool _securityGuard;
  bool _labour;
  bool _halwai;
  bool _watchmen;
  bool _deliveryBoy;
  bool _waiter;
  bool _maid;
  // cities
  bool _allCities;
  bool _mumbai;
  bool _delhi;
  bool _chennai;
  bool _kolkata;
  bool _lucknow;

  void _autoAllJobs() {
    if (_privateTutor == false &&
        _peon == false &&
        _driver == false &&
        _securityGuard == false &&
        _labour == false &&
        _halwai == false &&
        _deliveryBoy == false &&
        _watchmen == false &&
        _waiter == false &&
        _maid == false) {
      setState(() {
        _allJobs = true;
      });
    }
    if (_privateTutor == true ||
        _peon == true ||
        _driver == true ||
        _securityGuard == true ||
        _labour == true ||
        _halwai == true ||
        _deliveryBoy == true ||
        _watchmen == true ||
        _waiter == true ||
        _maid == true) {
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
    if (_currentSalaryRangeValues == null) {
      _currentSalaryRangeValues = RangeValues(
        widget.minVal.toDouble(),
        widget.maxVal.toDouble(),
      );
    }
    // night shift
    if (_nightShift == null) {
      _nightShift = widget.nightShift;
    }
    if (_jobType == null) {
      _jobType = widget.jobType;
    }

    // jobs
    if (_allJobs == null) {
      _allJobs = widget.allJobs;
    }
    if (_driver == null) {
      _driver = widget.driver;
    }
    if (_privateTutor == null) {
      _privateTutor = widget.privateTutor;
    }
    if (_peon == null) {
      _peon = widget.peon;
    }
    if (_securityGuard == null) {
      _securityGuard = widget.securityGuard;
    }
    if (_labour == null) {
      _labour = widget.labour;
    }
    if (_halwai == null) {
      _halwai = widget.halwai;
    }
    if (_watchmen == null) {
      _watchmen = widget.watchmen;
    }
    if (_deliveryBoy == null) {
      _deliveryBoy = widget.deliveryBoy;
    }
    if (_waiter == null) {
      _waiter = widget.waiter;
    }
    if (_maid == null) {
      _maid = widget.maid;
    }

    // cities
    if (_allCities == null) {
      _allCities = widget.allCities;
    }
    if (_mumbai == null) {
      _mumbai = widget.mumbai;
    }
    if (_chennai == null) {
      _chennai = widget.chennai;
    }
    if (_lucknow == null) {
      _lucknow = widget.lucknow;
    }
    if (_delhi == null) {
      _delhi = widget.delhi;
    }
    if (_kolkata == null) {
      _kolkata = widget.kolkata;
    }

    final cuid = FirebaseAuth.instance.currentUser.uid;
    Future<void> setSalaryRange() async {
      try {
        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cuid)
            .update({
          'minExpSalary': _currentSalaryRangeValues.start,
          'maxExpSalary': _currentSalaryRangeValues.end,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to set salary range.')),
        );
      }
    }

    Future<void> setJobTypeData() async {
      try {
        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cuid)
            .update({
          'jobType': _jobType == true ? 'Full-Time' : 'Part-Time',
          'preferredShift': _nightShift ? 'Night Shift' : 'Day Shift',
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to set Job Data Preference.')),
        );
      }
    }

    Future<void> uploadJobs() async {
      List<String> preferredJobs = [];
      if (_driver == true) {
        preferredJobs.add('Driver');
      }
      if (_privateTutor == true) {
        preferredJobs.add('Tutor');
      }
      if (_peon == true) {
        preferredJobs.add('Peon');
      }
      if (_securityGuard == true) {
        preferredJobs.add('Security Guard');
      }
      if (_labour == true) {
        preferredJobs.add('Labour');
      }
      if (_halwai == true) {
        preferredJobs.add('Halwai');
      }
      if (_watchmen == true) {
        preferredJobs.add('Watchman');
      }
      if (_deliveryBoy == true) {
        preferredJobs.add('Delivery Boy');
      }
      if (_waiter == true) {
        preferredJobs.add('Waiter');
      }
      if (_maid == true) {
        preferredJobs.add('Maid');
      }
      if (_allJobs == true) {
        preferredJobs = [
          'Driver',
          'Peon',
          'Security Guard',
          'Tutor',
          'Delivery Boy',
          'Labour',
          'Halwai',
          'Watchman',
          'Waiter',
          'Maid'
        ];
      }
      try {
        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cuid)
            .update({
          'expectedJobs': preferredJobs,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to set Preferred Jobs.')),
        );
      }
    }

    Future<void> uploadCities() async {
      List<String> preferredCities = [];

      if (_mumbai == true) {
        preferredCities.add('Mumbai');
      }
      if (_chennai == true) {
        preferredCities.add('Chennai');
      }
      if (_lucknow == true) {
        preferredCities.add('Lucknow');
      }
      if (_delhi == true) {
        preferredCities.add('Delhi');
      }
      if (_kolkata == true) {
        preferredCities.add('Kolkata');
      }
      if (_allCities == true) {
        preferredCities = ['Mumbai', 'Chennai', 'Lucknow', 'Delhi', 'Kolkata'];
      }
      try {
        await FirebaseFirestore.instance
            .collection('employeeProfile')
            .doc(cuid)
            .update({
          'preferredCities': preferredCities,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to set Preferred Cities.')),
        );
      }
    }

    Future<void> saveFilters() async {
      try {
        await setSalaryRange();
        await setJobTypeData();
        await uploadJobs();
        await uploadCities();
        // Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Filters Saved')),
        );
      } catch (e) {}
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            saveFilters();
          },
          child: Container(
            color: Colors.cyan,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Save ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
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
                max: 100000,
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
                      jobText: "Tutor",
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
                      jobText: "halwai",
                      checkbox: Checkbox(
                        value: _halwai,
                        onChanged: (val) {
                          setState(() {
                            _halwai = val;
                            _autoAllJobs();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Watchman",
                      checkbox: Checkbox(
                        value: _watchmen,
                        onChanged: (val) {
                          setState(() {
                            _watchmen = val;
                            _autoAllJobs();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Delivery Boy",
                      checkbox: Checkbox(
                        value: _deliveryBoy,
                        onChanged: (val) {
                          setState(() {
                            _deliveryBoy = val;
                            _autoAllJobs();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Waiter",
                      checkbox: Checkbox(
                        value: _waiter,
                        onChanged: (val) {
                          setState(() {
                            _waiter = val;
                            _autoAllJobs();
                          });
                        },
                      ),
                    ),
                    CustomCheckBox(
                      jobText: "Maid",
                      checkbox: Checkbox(
                        value: _maid,
                        onChanged: (val) {
                          setState(() {
                            _maid = val;
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
