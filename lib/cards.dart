import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class JobCards extends StatefulWidget {
  const JobCards({key}) : super(key: key);

  @override
  _JobCardsState createState() => _JobCardsState();
}

class _JobCardsState extends State<JobCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Swiper(
            layout: SwiperLayout.STACK,
            customLayoutOption:
                new CustomLayoutOption(startIndex: -1, stateCount: 3)
                    .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
              new Offset(-370.0, -40.0),
              new Offset(0.0, 0.0),
              new Offset(370.0, -40.0)
            ]),
            itemWidth: 300.0,
            itemHeight: 200.0,
            itemBuilder: (context, index) {
              return new Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan),
                // color: Colors.grey,
                child: new Center(
                  child: new Text("$index"),
                ),
              );
            },
            itemCount: 10),
      ),
    );
  }
}
