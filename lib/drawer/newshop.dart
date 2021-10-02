import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart' as syspaths;

class NewShop extends StatefulWidget {
  // const NewShop({ Key? key }) : super(key: key);
//
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

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.all(8),
          height: 500,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
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
                    maxLength: 20,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.store_sharp),
                      hintText: 'e.g  OYO',
                      labelText: 'Shop Name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  // Working Hours
                  TextFormField(
                    maxLength: 20,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.adjust_outlined),
                      hintText: 'e.g. Bakery',
                      labelText: 'Type of shop',
                    ),
                  ),
                  TextFormField(
                    maxLines: 2,
                    maxLength: 100,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.location_on_rounded),
                      hintText: '',
                      labelText: 'Shop Address',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(8),
                      icon: Icon(Icons.group_rounded),
                      hintText: 'e.g. 15',
                      labelText: 'Current number of employees',
                    ),
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
                Navigator.of(context).pop();
              },
              child: Icon(Icons.save),
            ))
      ],
    );
  }
}
