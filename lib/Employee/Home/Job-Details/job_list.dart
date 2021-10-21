import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:helping_hand/Employee/Home/filter.dart';
import 'package:helping_hand/Employee/Home/searchBar.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';

class JobList extends StatefulWidget {
  const JobList({Key key, this.text}) : super(key: key);

  @override
  _JobListState createState() => _JobListState();
  final String text;
}

class _JobListState extends State<JobList> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  bool isTapped;
  bool isExpanded;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF57752),
        brightness: Brightness.dark,
        elevation: 0,
        titleSpacing: 7.w,
        title: Row(
          children: [
            toggle == 0
                ? Text(
                    '${widget.text}',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                : Container(),
            SizedBox(
              width: 3.w,
            )
          ],
        ),
        centerTitle: true,
        actions: [
          SearchBar(),
          Filter(
            height: 3.h,
            margin: 8.5,
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 100.h,
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, item) {
                      double _w = MediaQuery.of(context).size.width;
                      return Opacity(
                        opacity: _animation.value,
                        child: Transform.translate(
                          offset: Offset(0, _animation2.value),
                          child: InkWell(
                            enableFeedback: true,
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => RouteWhereYouGo(),
                              //     ));

                              setState(() {
                                isTapped = !isTapped;
                              });
                            },
                            onHighlightChanged: (value) {
                              setState(() {
                                isExpanded = value;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 100.h,
                              child: AnimationLimiter(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(_w / 30),
                                  physics: BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      delay: Duration(milliseconds: 100),
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 2500),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        horizontalOffset: -300,
                                        verticalOffset: -850,
                                        child: ExpandedDetails(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Color(0xffF57752)
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Color(0xffF57752)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ExpandedDetails extends StatefulWidget {
  @override
  _ExpandedDetailsState createState() => _ExpandedDetailsState();
}

class _ExpandedDetailsState extends State<ExpandedDetails> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          onHighlightChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          child: Container(
            height: isTapped ? 9.h : 32.h,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isTapped
                  ? isExpanded
                      ? 65
                      : 70
                  : isExpanded
                      ? 225
                      : 230,
              width: isExpanded ? 385 : 390,
              decoration: BoxDecoration(
                color: Color(0xff6F12E8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6F12E8).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context
                                  .watch<GetUserInfo>()
                                  .fetchAndSetEmployerShops
                                  .shops[0]
                                  .shopName,
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context
                                  .watch<GetUserInfo>()
                                  .fetchAndSetEmployerShops
                                  .shops[0]
                                  .shopName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          isTapped
                              ? ''
                              : 'Widgets that have global keys reparent '
                                  'their subtrees when they are moved from one '
                                  'location in the tree to another location in '
                                  'the tree. In order to reparent its subtree, '
                                  'a widget must arrive at its new location in '
                                  'the tree in the same animation frame in '
                                  'which it was removed from its old location '
                                  'the tree.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
