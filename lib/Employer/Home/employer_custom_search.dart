import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helping_hand/Employer/Home/Employee-Details/employee_list.dart';
import 'package:sizer/sizer.dart';

class EmployerCustomSearch extends StatefulWidget {
  const EmployerCustomSearch({Key key}) : super(key: key);

  @override
  State<EmployerCustomSearch> createState() => _EmployerCustomSearchState();
}

class _EmployerCustomSearchState extends State<EmployerCustomSearch> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  List<String> JobTypes = [
    "Driver",
    "Halwai",
    "Peon",
    "Labour",
    "Tutor",
    "Guard",
    "Waiter",
    "Maid",
    "Watchman"
  ];
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
        // List title = tripSnapshot["expectedJobs"];
        // print(title);
        // print(title[0].toString());
        // print(title.map((e)=>title(e)=="Driver"));
        // for(int i=0;i<title.length;i++){
        if (i
            .toString()
            .toLowerCase()
            .contains(_searchController.text.toLowerCase())) {
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
    var data =
        await FirebaseFirestore.instance.collection('employeeProfile').get();
    setState(() {
      _allResults = data.docs;
      print(_allResults.toList());
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
              hintText: "maid,driver,etc",
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 4.55.w),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeList(
                                  text: _resultsList[index],
                                  salary: 100000,
                                  partTime: false,
                                  nightShift: false,
                                ),
                              ));
                        },
                        child: ListTile(
                          title: Text(_resultsList[index] ?? "Sweets"),
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
