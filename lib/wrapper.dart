import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:provider/provider.dart';

import 'Model/user.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    print(user);
    if (user == null){
      return LoginEmp();
    } else {
      return EmployeeHome();
    }
  }
}
