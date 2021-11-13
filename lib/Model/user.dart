import 'package:flutter/cupertino.dart';
import 'package:helping_hand/helpers/db_helper.dart';

class MyUser {
  String uid;
  bool isEmployer;
  bool isEmployee;
  String name;
  MyUser({
    this.uid,
    this.isEmployer,
    this.isEmployee,
    this.name,
  });
}

class UserType with ChangeNotifier {
  bool isEmployee = false;
  bool isEmployer = false;
  bool get userAsEmployee {
    return isEmployee;
  }

  bool get userAsEmployer {
    return isEmployer;
  }

  void setUserAsEmployee() async {
    isEmployee = true;
    isEmployer = false;
    // double count = 0;

    // if (count == 0) {
    //   try {
    //     await DBHelper.insert('userType', {
    //       'isEmployee': 0.toInt(),
    //       'isEmployer': 1.toInt(),
    //     });

    //     print('user set as employee for first time');
    //     count = count + 1;
    //   } catch (e) {
    //     print('error setting user as employee for first time');
    //   }
    // } else {
    //   try {
    //     await DBHelper.update('userType', {
    //       'isEmployee': 0.toInt(),
    //       'isEmployer': 1.toInt(),
    //     });
    //     print('user set as employee');
    //     count = count + 1;
    //   } catch (e) {
    //     print('error setting user as employee');
    //   }
    // }
    print('set as employee');
    notifyListeners();
  }

  void setUserAsEmployer() async {
    isEmployer = true;
    isEmployee = false;
    // double count = 0;
    // if (count == 0) {
    //   try {
    //     await DBHelper.insert('userType', {
    //       'isEmployee': 1.toInt(),
    //       'isEmployer': 0.toInt(),
    //     });
    //     print('user set as employer for first time');
    //     count = count + 1;
    //   } catch (e) {
    //     print('error setting user as employer for first time');
    //   }
    // } else {
    //   try {
    //     await DBHelper.update('userType', {
    //       'isEmployee': 1.toInt(),
    //       'isEmployer': 0.toInt(),
    //     });
    //     print('user set as employer ');
    //     count = count + 1;
    //   } catch (e) {
    //     print('error setting user as employer');
    //   }
    // }
    print('set as employer');
    notifyListeners();
  }

  Future<Map<String, bool>> fetchAndSetUserType() async {
    final dataList = await DBHelper.getData('userType');
    // print('fetching data');
    var employee = 1;
    var employer = 1;
    try {
      dataList.forEach((e) => {
            employee = (e['isEmployee']),
            employer = (e['isEmployer']),
            if (employee == 0)
              {
                isEmployee = true,
                isEmployer = false,
              }
            else if (employer == 0)
              {
                isEmployee = false,
                isEmployer = true,
              }
            else
              {
                isEmployee = false,
                isEmployer = false,
              }
          });
      // print(dataList);

      // print(isEmployee);
      // print(isEmployer);
    } catch (e) {
      print('failed to fetch data.');
    }
    // print('data fetched!');
    notifyListeners();

    Map<String, bool> data = {
      'isEmployee': isEmployee,
      'isEmployer': isEmployer,
    };
    return data;
  }
}




//TODO:Create a separate collection for employee and employer profile