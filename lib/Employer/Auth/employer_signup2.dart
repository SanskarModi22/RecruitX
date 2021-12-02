import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employer/Home/employer_home.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:helping_hand/widgets/shop_refs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class EmployerSignUp2 extends StatefulWidget {
  // const signup_page_1({ Key? key }) : super(key: key);
  final String shopName;
  final String employerName;
  final String employerAge;
  final String employerDOB;
  final String employerContactNumber;
  final String OwnerImage;

  const EmployerSignUp2(
      {Key key,
      this.shopName,
      this.employerName,
      this.employerAge,
      this.employerDOB,
      this.employerContactNumber,
      this.OwnerImage})
      : super(key: key);
  @override
  _EmployerSignUp2State createState() => _EmployerSignUp2State();
}

// ignore: camel_case_types
class _EmployerSignUp2State extends State<EmployerSignUp2> {
  final ImagePicker _picker = ImagePicker();

  File ShopImage;

  //image from camera
  _imgFromCamera() async {
    XFile pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        ShopImage = File(pickedImage.path);
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
        ShopImage = File(pickedImage.path);
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
              padding: EdgeInsets.symmetric(vertical: 3.75.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.7.sp,
                    child: IconButton(
                      iconSize: 30.7.sp,
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 7.5.w,
                  ),
                  CircleAvatar(
                    radius: 30.7.sp,
                    child: IconButton(
                        iconSize: 30.7.sp,
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
  String imgUrl;
  void _storeShopImages() async{
    final user = await FirebaseAuth.instance.currentUser;
    final ref = FirebaseStorage.instance
        .ref()
        .child('Shop Photo')
        .child(user.uid+DateTime.now().toString()+'.png');
    // putting file
    await ref.putFile(ShopImage).whenComplete(() => null);
    // gettting url
    imgUrl = await ref.getDownloadURL();
  }
  final address = TextEditingController();
  final city = TextEditingController();
  final State = TextEditingController();
  final AadharNum = TextEditingController();
  final shopDescription = TextEditingController();
  final bio = TextEditingController();
  @override
  final _formkey2 = GlobalKey<FormState>();
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
  String dropdownValue = 'Mumbai';
  String dropdownValue2 = 'Maharashtra';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    _storeShopImages();
    return Form(
      key: _formkey2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(7.5.w, 2.5.h, 7.5.w, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.75.h,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'City',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                       dropdownColor: Colors.black,
                        style: TextStyle(color: Colors.white),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Mumbai',
                          'Kolkata',
                          'Chennai',
                          'Delhi',
                          'Lucknow'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20,color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'State',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue2,
                        elevation: 16,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>[
                          'Maharashtra',
                          'West Bengal',
                          'Tamil Nadu',
                          'Delhi',
                          'Uttar Pradesh',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.75.h,
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
                      hintText: 'Aadhar number with proper spacing',
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
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ) {
                        return 'Required*';
                      }
                      if(RegExp(r"^[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}$").hasMatch(value)==false)
                      return 'Enter valid Aadhar number';
                      return null;
                    }

                  ),
                  SizedBox(
                    height: 3.75.h,
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
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.75.h,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.75.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Shop Photo",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 22.5.w,
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
                            height: 13.75.h,
                            width: 27.5.w,
                            child: ShopImage != null
                                ? Image.file(
                                    ShopImage,
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
                    height: 3.7.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(100.w,6.25.h)),
                    ),
                    onPressed: () {
                      if (ShopImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter image!')),
                        );
                      }
                      if (_formkey2.currentState.validate() &&
                          ShopImage != null) {
                        DatabaseServices(uid: user.uid).updateEmployerData(
                          employerAddress: address.text,
                          city: dropdownValue,
                          state: dropdownValue2,
                          aadhar: AadharNum.text,
                          employerName: widget.employerName,
                          employerAge: widget.employerAge,
                          employerDOB: widget.employerDOB,
                          employerContactNumber: widget.employerContactNumber,
                          isEmployer:
                              Provider.of<UserType>(context, listen: false)
                                  .userAsEmployer,
                          isEmployee:
                              Provider.of<UserType>(context, listen: false)
                                  .userAsEmployee,
                          shopImg: imgUrl,
                          shopDesc: shopDescription.text,
                          employerImg: widget.OwnerImage,
                           employerBio: bio.text,
                        );
                        DatabaseServices(uid: user.uid).updateShop(
                          shopImage: imgUrl,
                          shopAddress: address.text,
                          shopDesc: shopDescription.text,
                          shopName: widget.shopName,
                          employerName: widget.employerName,
                          state: dropdownValue2,
                          city: dropdownValue,
                        );
                        clearText();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmployerHome()));
                      }
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 13.8.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.25.h,
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
