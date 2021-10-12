import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Employer/Home/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/user.dart';
import 'Shared/base.dart';
var option="";
class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future getValidationData() async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedOption = preferences.getString('option');
    print(obtainedOption);
    setState(() {
      option = obtainedOption;
    });
  }
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2), () {
      });
    super.initState();
  });}
  @override
  Widget build(BuildContext context) {
    print(option);
    final user = Provider.of<MyUser>(context);
    print(user);
    if(user!=null&&option=='1') {
      return EmployerHome();
    }
    else  if(user!=null&&option=='2'){
      return EmployeeHome();
    }
    else{
      return Base();
    }

  }
}
