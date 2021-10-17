<<<<<<< HEAD
// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:helping_hand/Employee/Auth/login_employee.dart';
// import 'package:helping_hand/Model/shop.dart';
>>>>>>> cd961e07917b307894312651b2f5d44bb2378f58
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:helping_hand/Splash/splash_screen.dart';
// import 'package:helping_hand/Shared/base.dart';
// import 'package:helping_hand/base.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'Services/Authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider(create: (_)=>DatabaseServices().getemployerData(), initialData:"Loading.."),
      StreamProvider(create: (_)=>DatabaseServices().getempData(), initialData:"Loading.."),
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
<<<<<<< HEAD
      return StreamProvider<MyUser>.value(
        value: AuthServices()
            .user, //Getting the instance of the user through stream
        initialData: null,
        catchError: (User, MyUser) => null,
=======
      return MultiProvider(
        providers: [
          StreamProvider<MyUser>.value(
            value: AuthServices()
                .user, //Getting the instance of the user through stream
            initialData: null,
            catchError: (User, MyUser) => null,
          ),
          ChangeNotifierProvider(
            create: (ctx) => GetUserInfo(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => UserType(),
          ),
        ],
>>>>>>> cd961e07917b307894312651b2f5d44bb2378f58
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
