import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class EmployeeSearchBar extends StatefulWidget {
   EmployeeSearchBar({key,this.textEditingController}) : super(key: key);
  TextEditingController textEditingController;


  @override
  _EmployeeSearchBarState createState() => _EmployeeSearchBarState();
}

int toggle = 0;

// ignore: camel_case_types
class _EmployeeSearchBarState extends State<EmployeeSearchBar>
    with SingleTickerProviderStateMixin {
  AnimationController _con;
  // TextEditingController _searchController=widget.textEditingController;
  //
  // Future resultsLoaded;
  // List _allResults = [];
  // List _resultsList = [];
  // bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    // _searchController = TextEditingController();
    // _searchController.addListener(_onSearchChanged);
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }
  // @override
  // void dispose() {
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   resultsLoaded = getUsersPastTripsStreamSnapshots();
  // }
  //
  // _onSearchChanged() {
  //   searchResultsList();
  // }
  //
  // searchResultsList() {
  //   var showResults = [];
  //
  //   if (_searchController.text != "") {
  //     for (var tripSnapshot in _allResults) {
  //       var title = tripSnapshot["shopName"].toString().toLowerCase();
  //
  //       if (title.toLowerCase().contains(_searchController.text.toLowerCase())) {
  //         showResults.add(tripSnapshot);
  //         setState(() {
  //           isExpanded = true;
  //         });
  //       }
  //     }
  //   } else {
  //     // showResults = List.from(_allResults);
  //     setState(() {
  //       isExpanded = false;
  //     });
  //   }
  //   setState(() {
  //     _resultsList = showResults;
  //   });
  // }
  //
  // getUsersPastTripsStreamSnapshots() async {
  //   // final user = Provider.of<MyUser>(context);
  //   var data = await FirebaseFirestore.instance
  //       .collection('jobs')
  //       .get();
  //   setState(() {
  //     _allResults = data.docs;
  //   });
  //   searchResultsList();
  //   return "complete";
  // }


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);
    return Container(
      child: Container(
        // color: Colors.wh,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height / 8,
            width: (toggle == 0) ? width / 8.166 : width / 1.57,
            alignment: Alignment(-1.0, 0.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 48.0,
              width: (toggle == 0) ? width / 8.166 : width / 1.57,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 400),
                    top: 6.0,
                    right: 7.0,
                    curve: Curves.easeOut,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F3F7),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: AnimatedBuilder(
                          child: Icon(
                            Icons.mic,
                            size: 22.0,
                            color: Colors.blue[900],
                          ),
                          builder: (context, widget) {
                            return Transform.rotate(
                              angle: _con.value * 2.0 * pi,
                              child: widget,
                            );
                          },
                          animation: _con,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 375),
                    left: (toggle == 0) ? 20.0 : 40.0,
                    curve: Curves.easeOut,
                    top: 11.0,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                      height: 23.0,
                      width: 180.0,
                      child: TextField(
                        controller:widget.textEditingController,
                        cursorRadius: Radius.circular(10.0),
                        cursorWidth: 2.0,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Shop Name..',
                          labelStyle: TextStyle(
                            color: Color(0xff5B5B5B),
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                        ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: IconButton(
                      splashRadius: 19.0,
                      icon: Icon(Icons.search, size: 20.0,color: Colors.blue[900],),
                      onPressed: () {
                        setState(
                          () {
                            if (toggle == 0) {
                              toggle = 1;
                              _con.forward();
                            } else {
                              toggle = 0;
                              widget.textEditingController.clear();
                              _con.reverse();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
