import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Employer/Auth/employer_signup2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EmployerSignUp extends StatefulWidget {
  const EmployerSignUp({key}) : super(key: key);

  @override
  _EmployerSignUpState createState() => _EmployerSignUpState();
}

class _EmployerSignUpState extends State<EmployerSignUp> {
  final ImagePicker _picker = ImagePicker();

  File ownerImage;

  //image from camera
  _imgFromCamera() async {
    XFile pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        ownerImage = File(pickedImage.path);
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
        ownerImage = File(pickedImage.path);
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
                    radius: 9.9.w,
                    child: IconButton(
                      iconSize: 9.9.w,
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
                    radius: 9.9.w,
                    child: IconButton(
                        iconSize: 9.9.w,
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
  void _storeEmployerImages() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    final ref = FirebaseStorage.instance
        .ref()
        .child('Employer Photo')
        .child(user.uid + '.png');
    // putting file
    await ref.putFile(ownerImage).whenComplete(() => null);
    // gettting url
    imgUrl = await ref.getDownloadURL();
  }

  final shopName = TextEditingController();
  final OwnerName = TextEditingController();
  final OwnerAge = TextEditingController();
  final dob = TextEditingController();
  final contact = TextEditingController();
  @override
  final _formkey = GlobalKey<FormState>();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    shopName.dispose();
    OwnerName.dispose();
    OwnerAge.dispose();
    dob.dispose();
    contact.dispose();
    super.dispose();
  }

  clearText() {
    shopName.clear();
    OwnerName.clear();
    OwnerAge.clear();
    dob.clear();
    contact.clear();
  }

  DateTime _dateTime2;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if (ownerImage != null) {
      _storeEmployerImages();
    } else {
      print("Kartik is smart");
    }
    _storeEmployerImages();
    return Form(
      key: _formkey,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Owner Photo",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 4.5.w,
                        ),
                      ),
                      SizedBox(
                        width: 22.5.w,
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
                            height: 13.75.h,
                            width: 27.5.w,
                            child: ownerImage != null
                                ? Image.file(
                                    ownerImage,
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
                            top: 8.75.h,
                            left: 11.25.w,
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
                    height: 3.75.h,
                  ),
                  TextFormField(
                    controller: shopName,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      hintText: 'Shop/Company name',
                      // labelText: 'Shop/Company name',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid shop name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.75.h,
                  ),
                  TextFormField(
                    controller: OwnerName,
                    decoration: InputDecoration(
                      // floatingLabelBehavior: FloatingLabelBehavior.always,

                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Owner name',
                      //  labelText: 'Owner name',
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
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.75.h,
                  ),
                  Container(
                    width: 45.w,
                    child: TextFormField(
                      controller: OwnerAge,
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                        ),
                        hintText: 'Age',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 6.25.h,
                    width: 50.w,
                    //color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _dateTime2 == null
                            ? 'Enter your DOB'
                            : DateFormat.yMMMd().format(_dateTime2),
                        style: TextStyle(
                          fontSize: 4.9.w,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 9,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2070))
                            .then((value) {
                          setState(() {
                            _dateTime2 = value;
                          });
                        });
                      },
                      child: Text('Pick a Date', style: TextStyle(
                        fontSize: 4.5.w,
                      ),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(400,50)),
                    ),),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  TextFormField(
                    controller: contact,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Phone Number',
                      // labelText: 'Phone Number',
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
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Enter valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.75.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(100.w,6.25.h)),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   side: BorderSide(width: 150),
                    //
                    //   primary: Colors.green,
                    //   fixedSize: Size(400, 45),
                    // ),
                    onPressed: () {
                      if (ownerImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter image!')),
                        );
                      }
                      if (_formkey.currentState.validate() &&
                          ownerImage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployerSignUp2(
                              shopName: shopName.text,
                              employerName: OwnerName.text,
                              employerAge: OwnerAge.text,
                              employerDOB: DateFormat.yMMMd().format(_dateTime2),
                              employerContactNumber: contact.text,
                              OwnerImage: imgUrl,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 4.4.w,
                      ),
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
