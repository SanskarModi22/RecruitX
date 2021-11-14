import 'dart:io';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employer/Home/Home.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class EmployerSignUp2 extends StatefulWidget {
  // const signup_page_1({ Key? key }) : super(key: key);
  final String shopName;
  final String employerName;
  final String employerAge;
  final String employerDOB;
  final String employerContactNumber;
  final File shopImg;

  const EmployerSignUp2(
      {Key key,
      this.shopName,
      this.employerName,
      this.employerAge,
      this.employerDOB,
      this.employerContactNumber,
      this.shopImg})
      : super(key: key);
  @override
  _EmployerSignUp2State createState() => _EmployerSignUp2State();
}

// ignore: camel_case_types
class _EmployerSignUp2State extends State<EmployerSignUp2> {
  final ImagePicker _picker = ImagePicker();

  File LicenseImage;

  //image from camera
  _imgFromCamera() async {
    XFile pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        LicenseImage = File(pickedImage.path);
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
        LicenseImage = File(pickedImage.path);
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

  final address = TextEditingController();
  final city = TextEditingController();
  final State = TextEditingController();
  final AadharNum = TextEditingController();
  final shopDescription = TextEditingController();
  final bio=TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    address.dispose();
    city.dispose();
    State.dispose();
    AadharNum.dispose();
    shopDescription.dispose();
    bio.dispose();
    super.dispose();
  }

  clearText() {
    address.clear();
    city.clear();
    State.clear();
    AadharNum.clear();
    shopDescription.clear();
    bio.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Shop Address',
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
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 150,
                          child: TextFormField(
                            controller: city,
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
                            controller: State,
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
                TextFormField(
                  controller: AadharNum,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Aadhar number',
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
                  controller: bio,
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Bio',
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
                  controller: shopDescription,
                  minLines: 2,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    hintText: 'Shop Description',
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
                          child: LicenseImage != null
                              ? Image.file(
                                  LicenseImage,
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
                    hintText: ' Shop Rating',
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 150),
                    primary: Colors.green,
                    fixedSize: Size(400, 45),
                  ),
                  onPressed: () {
                    DatabaseServices(uid: user.uid).updateEmployerData(
                      employerAddress: address.text,
                      city: city.text,
                      state: State.text,
                      employerBio: bio.text,
                      aadhar: AadharNum.text,
                      shopDesc: shopDescription.text,
                      shopName: widget.shopName,
                      employerName: widget.employerName,
                      employerAge: widget.employerAge,
                      employerDOB: widget.employerDOB,
                      employerContactNumber: widget.employerContactNumber,
                      isEmployer: Provider.of<UserType>(context, listen: false)
                          .userAsEmployer,
                      isEmployee: Provider.of<UserType>(context, listen: false)
                          .userAsEmployee,
                      licenseImg: LicenseImage,
                    );
                    DatabaseServices(uid: user.uid).updateShop(
                      city: city.text,
                      state: State.text,
                      employerName: widget.employerName,
                      shopName: widget.shopName,
                      shopDesc: shopDescription.text,
                      shopAddress: address.text,
                      shopImage: widget.shopImg,
                    );
                    clearText();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployerHome()));
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
