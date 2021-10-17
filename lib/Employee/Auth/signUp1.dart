import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:image_picker/image_picker.dart';

class EmployeeSignUp extends StatefulWidget {
  const EmployeeSignUp({key}) : super(key: key);

  @override
  _EmployeeSignUpState createState() => _EmployeeSignUpState();
}

class _EmployeeSignUpState extends State<EmployeeSignUp> {
  final ImagePicker _picker = ImagePicker();
  File shopImage;
  //image from camera
  _imgFromCamera() async {
    XFile pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        shopImage = File(pickedImage.path);
      });
    } else {
      return;
    }
  }

  //image from gallery
  _imgFromGallery() async {
    XFile pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        shopImage = File(pickedImage.path);
      });
    } else {
      return;
    }
  }

  //show picker function
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.photo_library),
                        onPressed: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("signup"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[300],
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 110,
                      width: 110,
                      child: shopImage != null
                          ? Image.file(
                              shopImage,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text(
                                'No Image Selected!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                    Positioned(
                      top: 70,
                      left: 45,
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Colors.white,
                        child: Icon(Icons.add_a_photo),
                        onPressed: () {
                          _showPicker(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Username',
                    labelText: 'Username',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Address',
                    labelText: 'Address',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 30,
                        width: 50,
                        child: Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                              color: Colors.green,
                            ),
                            hintText: '',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                              hintText: 'City',
                              labelText: 'City',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                              hintText: 'State',
                              labelText: 'State',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Salary Expectations',
                    labelText: 'Salary Expectations',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: '  Description',
                    labelText: ' Description',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    hintText: 'Experience',
                    labelText: 'Experience',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 150),
                    primary: Colors.green,
                    fixedSize: Size(400, 45),
                  ),
                  onPressed: () {
                    /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmployeeHome()),
                                    );*/
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginEmp()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
