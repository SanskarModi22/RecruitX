import 'package:flutter/material.dart';

class NewJob extends StatefulWidget {
  // const NewJob({ Key? key }) : super(key: key);
//
  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  String _jobTitle;
  String _shopname;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      // margin: EdgeInsets.all(8),
      height: 600,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                'Post a new Job',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
              // Shop
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'In Shop',
                  icon: Icon(Icons.store_sharp),
                ),
                value: _shopname,
                items: <String>[
                  'Shop 1 name',
                  'Shop 2 name',
                  'Shop 3 name',
                  'Shop 4 name',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _shopname = newValue;
                  });
                },
              ),
              // Job title
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Looking for',
                  icon: Icon(Icons.work_outline),
                ),
                value: _jobTitle,
                items: <String>[
                  'Waiter',
                  'Private Tutor',
                  'Car Driver',
                  'Delivery Boy',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _jobTitle = newValue;
                  });
                },
              ),
              // Monthly Salary
              TextFormField(
                maxLength: 20,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.monetization_on_outlined),
                  hintText: 'e.g  Rs 15,000',
                  labelText: 'Monthly salary (in Rupees)',
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              // Working Hours
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.watch_later_outlined),
                  hintText: 'e.g. 9:00 am to 5:00 pm',
                  labelText: 'Working Hours',
                ),
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8),
                  icon: Icon(Icons.watch_later),
                  hintText: 'Everyday except sunday',
                  labelText: 'Working Days',
                ),
              ),
              TextFormField(
                maxLines: 3,
                initialValue: '',
                maxLength: 150,
                decoration: InputDecoration(
                    icon: Icon(Icons.info_outline),
                    labelText: 'Other info',
                    labelStyle: TextStyle(
                      color: Colors.teal[900],
                    ),
                    hintText: 'This Section is Optional'),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    margin: EdgeInsets.only(top: 20, bottom: 0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
