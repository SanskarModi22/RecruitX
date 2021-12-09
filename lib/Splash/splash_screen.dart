import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Wrapper(),
        ),
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 100.w,
          child: FittedBox(
            child: TextLiquidFill(
              text: 'RecruitX',
              waveColor: Colors.orange,
              // boxBackgroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontSize: 19.w,
                fontWeight: FontWeight.bold,
              ),
              // boxHeight: 37.5.h,
            ),
          ),
        ),
      ),
    );
  }
}
