import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 6.5.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.h),
        // border: Border.all(
        //   color: Color.fromRGBO(71, 71, 71, 1),
        // ),
      ),
      child: TextField(
        cursorColor: Colors.blue[100],
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.light,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          // enabled: false,
          prefixIcon: Icon(
            FontAwesomeIcons.search,
            size: 3.1.h,
            color: Colors.blueAccent,
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.microphone,
            size: 3.1.h,
            color: Colors.blueAccent,
          ),
          contentPadding: EdgeInsets.all(1.2.h),
          hintText: "Find Jobs",
          hintStyle: TextStyle(
              color: Colors.grey[600], fontSize: 2.7.h),
        ),
      ),
    );
  }
}
