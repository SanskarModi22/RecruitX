import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Home.dart';
import 'package:helping_hand/Employer/Auth/login_employer.dart';
import 'package:image_picker/image_picker.dart';

class EmployerSignUp extends StatefulWidget {
  const EmployerSignUp({key}) : super(key: key);

  @override
  _EmployerSignUpState createState() => _EmployerSignUpState();
}

class _EmployerSignUpState extends State<EmployerSignUp> {
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
        title: Text("signup"),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    labelText: 'Shop/Company name',
                    focusColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white,
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
                    // floatingLabelBehavior: FloatingLabelBehavior.always,

                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    //  hintText: 'Owner name',
                    labelText: 'Owner name',
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
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Phone Number',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Shop Photo",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    //imagepicker
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
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Shop Address',
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
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'City',
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
                          width: 40,
                        ),
                        Container(
                          height: 80,
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'State',
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
                Row(
                  children: [
                    Text(
                      "Aadhar number",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 160,
                      child: TextFormField(
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: '',
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Working Hours',
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
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    labelText: 'Shop Description',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "License Photo",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 90,
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
                  ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeHome()),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                                    builder: (context) => LoginEmployer()));
                          },
                          child: Text("Login")),
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
