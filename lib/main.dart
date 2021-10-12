import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Splash/splash_screen.dart';
import 'package:helping_hand/Shared/base.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'Services/Authentication.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return StreamProvider<MyUser>.value(
        value: AuthServices().user,//Getting the instance of the user through stream
        initialData: null,
        catchError: (User,MyUser)  => null,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              // primarySwatch: Colors.blue,
              ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      );
    });
  }
}
