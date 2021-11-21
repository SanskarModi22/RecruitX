import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart' as syspaths;

class NewShop extends StatefulWidget {
  // const NewShop({ Key? key }) : super(key: key);
//
  final String myName;
  NewShop(this.myName);
  @override
  _NewShopState createState() => _NewShopState();
}

class _NewShopState extends State<NewShop> {
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

  final formkey = GlobalKey<FormState>();
  String dropdownValue = 'Mumbai';
  TextEditingController _shopName = TextEditingController();
  TextEditingController _shopType = TextEditingController();
  TextEditingController _shopDesc = TextEditingController();
  TextEditingController _shopAddress = TextEditingController();
  // TextEditingController shopName = TextEditingController();

  String shopImgUrl = '';

  Future<void> setImgUrl() async {
    final uId = FirebaseAuth.instance.currentUser.uid;

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('Shop Photo')
          .child(uId + DateTime.now().toString() + '.jpg');
      // putting file
      await ref.putFile(shopImage).whenComplete(() => null);
      // gettting url
      shopImgUrl = await ref.getDownloadURL();
      print(shopImgUrl);
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to upload shop image')),
      // );
    }
  }

  Widget build(BuildContext context) {
    final uId = FirebaseAuth.instance.currentUser.uid;
    setImgUrl();

    Future<void> postShop() async {
      try {
        await FirebaseFirestore.instance.collection('shops').add({
          'city': dropdownValue,
          'ownerId': uId,
          'ownerName': widget.myName,
          'shopAddress': _shopAddress.text,
          'shopDesc': _shopDesc.text,
          'shopImgUrl': shopImgUrl,
          'shopName': _shopName.text,
          'shopType': _shopType.text,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to post shop')),
        );
      }
      Navigator.of(context).pop();
    }

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.all(8),
          // height: 500,
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Add a new Shop',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    height: 120,
                    width: 180,
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

                  TextButton(
                    onPressed: () {
                      _showPicker(context);
                    },
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Icon(Icons.add_a_photo),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Add Shop Image'),
                        ],
                      ),
                    ),
                  ),
                  // Shop Name
                  TextFormField(
                    controller: _shopName,
                    autofocus: true,
                    maxLength: 20,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.store_sharp),
                      hintText: 'e.g  OYO',
                      labelText: 'Shop Name',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.length == 0 || value == null)
                        return '*required';
                      return null;
                    },
                  ),
                  // Working Hours
                  TextFormField(
                    controller: _shopType,
                    autofocus: true,
                    maxLength: 20,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.adjust_outlined),
                      hintText: 'e.g. Bakery',
                      labelText: 'Type of shop',
                    ),
                    validator: (value) {
                      if (value.length == 0 || value == null)
                        return '*required';
                      return null;
                    },
                  ),

                  Container(
                    // padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'City:',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Mumbai',
                            'Delhi',
                            'Lucknow',
                            'Chennai',
                            'Kolkata',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _shopDesc,
                    autofocus: true,
                    maxLines: 2,
                    maxLength: 100,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.insert_drive_file_rounded),
                      hintText: '',
                      labelText: 'Shop Description',
                    ),
                    validator: (value) {
                      if (value.length == 0 || value == null)
                        return '*required';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _shopAddress,
                    autofocus: true,
                    maxLines: 2,
                    maxLength: 100,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.location_on_rounded),
                      hintText: '',
                      labelText: 'Shop Address',
                    ),
                    validator: (value) {
                      if (value.length == 0 || value == null)
                        return '*required';
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 10,
            // top: 60,
            bottom: 40,
            child: FloatingActionButton(
              onPressed: () {
                if (formkey.currentState.validate() && shopImage != null) {
                  postShop();
                }
              },
              child: Icon(Icons.save),
            ))
      ],
    );
  }
}
