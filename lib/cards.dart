import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sizer/sizer.dart';

class JobCards extends StatefulWidget {
  const JobCards({key}) : super(key: key);

  @override
  _JobCardsState createState() => _JobCardsState();
}

class _JobCardsState extends State<JobCards> {
  @override
  List<String> PopularJobs = [
    "Driver",
    "Lundary",
    "Waiter",
    "Maid",
    "Compounder",
    "Washerman"
  ];
  List<String> JobAvailable = ["15", "27", "18", "19", "20", "21"];
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: PopularJobs.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.transparent,
                child: Container(
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: (index % 2) == 0 ? Colors.purple[300] : Colors.orange,
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          PopularJobs[index],
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 90.w,
                          child: Text(
                            "${JobAvailable[index]} jobs are availaible",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        )
                      ]),
                ),
              ),
            );
          }),
      // child: Swiper(
      //     layout: SwiperLayout.STACK,
      //     customLayoutOption:
      //         new CustomLayoutOption(startIndex: -1, stateCount: 3)
      //             .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
      //       new Offset(-370.0, -40.0),
      //       new Offset(0.0, 0.0),
      //       new Offset(370.0, -40.0)
      //     ]),
      //     itemWidth: 300.0,
      //     itemHeight: 200.0,
      //     itemBuilder: (context, index) {
      //       return new Container(
      //         margin: EdgeInsets.only(left: 20.0, right: 20.0),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(30),
      //             color: Colors.cyan),
      //         // color: Colors.grey,
      //         child: new Center(
      //           child: new Text("$index"),
      //         ),
      //       );
      //     },
      //     itemCount: 10),
    );
  }
}
