import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class JobOptions extends StatefulWidget {
  const JobOptions({key}) : super(key: key);

  @override
  _JobOptionsState createState() => _JobOptionsState();
}

class _JobOptionsState extends State<JobOptions> {
  @override
  List<String> Jobs = [
    "Grocery",
    "Halwai",
    "Medical",
    "Restaurant",
    "Maid Service"
  ];
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Jobs.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                child: Padding(
                  padding: EdgeInsets.all(7.sp),
                  child: Card(
                    // elevation: 1.sp,
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: Text(
                          Jobs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    // return ConstrainedBox(
    //     // child: ListView(
    //     //   scrollDirection: Axis.horizontal,
    //     //   children: [
    //     //     Padding(
    //     //       padding: const EdgeInsets.all(8.0),
    //     //       child: Row(
    //     //         mainAxisAlignment: MainAxisAlignment.center,
    //     //         // runSpacing: 6.0,
    //     //         children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
    //     //           (i) {
    //     //             return Padding(
    //     //               padding: const EdgeInsets.all(8.0),
    //     //               child: new SizedBox(
    //     //                 width: MediaQuery.of(context).size.width / 5,
    //     //                 child: Padding(
    //     //                     padding: new EdgeInsets.only(top: 6.0),
    //     //                     child: Container(
    //     //                       height: height / 10,
    //     //                       decoration: BoxDecoration(
    //     //                         borderRadius: BorderRadius.circular(25.0),
    //     //                         color: Colors.amberAccent,
    //     //                       ),
    //     //                     )),
    //     //               ),
    //     //             );
    //     //           },
    //     //         ).toList(),
    //           ),
    //         ),
    //       ],
    //     ),
    //     //   },
    //     //   // pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
    //     //   itemCount: 10,
    //     // ),
    //     constraints: new BoxConstraints.loose(
    //         new Size(MediaQuery.of(context).size.width, 170.0)));
  }
}
