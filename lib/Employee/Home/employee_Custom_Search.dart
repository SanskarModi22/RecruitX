import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Job-Details/job_list.dart';

class EmployeeCustomSearch extends StatefulWidget {
  const EmployeeCustomSearch({Key key}) : super(key: key);

  @override
  State<EmployeeCustomSearch> createState() => _EmployeeCustomSearchState();
}

class _EmployeeCustomSearchState extends State<EmployeeCustomSearch> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  List<String>JobTypes=["Driver","Halwai","Peon","Labour","Tutor","Security Guard","Waiter","Maid","Watchman","Delivery Boy"];
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var i in JobTypes) {
        // var title = tripSnapshot["shopType"].toString().toLowerCase();

        if (i.toString().toLowerCase().contains(_searchController.text.toLowerCase())) {
          showResults.add(i);
          setState(() {
            isExpanded = true;
          });
        }
      }
    } else {
      // showResults = List.from(_allResults);
      setState(() {
        isExpanded = false;
      });
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    // final user = Provider.of<MyUser>(context);
    var data = await FirebaseFirestore.instance
        .collection('jobs')
        .orderBy('shopType')
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 85.w,
          height: 6.5.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.h),
          ),
          child: TextField(
            controller: _searchController,
            cursorColor: Colors.blue[600],
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
              hintText: "driver,waiter,maid,etc",
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 4.2.w),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: isExpanded ? 20.h : 0,
                width: 85.w,
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(_resultsList[index]);
                    return Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobList(text: _resultsList[index],),
                              ));
                        },
                        child: ListTile(
                          title:
                              Text(_resultsList[index] ?? "Sweets"),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ),
      ],
    );
  }
}
