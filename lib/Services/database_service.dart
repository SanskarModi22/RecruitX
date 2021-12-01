import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helping_hand/Model/Profile/employee_profile.dart';
import 'package:helping_hand/Model/Profile/employer_profile.dart';
import 'package:helping_hand/Model/review.dart';
import 'package:helping_hand/Model/shop.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:provider/provider.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  CollectionReference employeeProfile =
      FirebaseFirestore.instance.collection('employeeProfile');
  CollectionReference employerProfile =
      FirebaseFirestore.instance.collection('employerProfile');
  CollectionReference shops = FirebaseFirestore.instance.collection('shops');

  // ignore: todo
  //TODO:EMPLOYEE
  //ADD and UPDATE Employee
  Future<void> updateEmployeeData(
      {String aadhar,
      String employeeName,
      String employeeAddress,
      String employeeContactNumber,
      String employeeBio,
      String employeeAge,
      String employeeDOB,
      String employeeExperience,
      String employeeExpectedSalary,
      dynamic employeeExpectedJobs,
      dynamic applications,
      String currentlyWorkingAt,
      String preferredJobType,
      String employeePreferedShift,
      double averageRating,
      String imgUrl,
      List<ReviewByEmployer> reviews,
      bool isEmployee,
      int minSal,
      int maxSal,
      String uid}) async {
    return await employeeProfile.doc(this.uid).set(
      {
        'name': employeeName,
        'address': employeeAddress,
        'contact': employeeContactNumber,
        'bio': employeeBio,
        'dob': employeeDOB,
        'age': employeeAge,
        'experience': employeeExperience,
        'expectedJobs': employeeExpectedJobs,
        'currentWork': currentlyWorkingAt,
        'jobType': preferredJobType,
        'preferredShift': employeePreferedShift,
        'aadhar': aadhar,
        'isEmployee': isEmployee,
        'img_url': imgUrl,
        'minExpSalary': minSal,
        'maxExpSalary': maxSal,
        'appliedJobs': applications,
        'preferredCities': [],
        'backgroundImgUrl':
            "https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg",
      },
    );
  }

//DELETE Employee
  Future<void> deleteEmployee() {
    return employeeProfile
        .doc(uid)
        .delete()
        .then((value) => print("$uid Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  //READ Employee
  Employee _empFromSnap(DocumentSnapshot snapshot) {
    return Employee(
        uid: snapshot['uid'],
        employeeImage: snapshot['img_url'],
        averageRating: snapshot['averageRating'],
        currentlyWorkingAt: snapshot['currentWork'],
        employeeAge: snapshot['age'],
        employeeAddress: snapshot['address'],
        employeeBio: snapshot['bio'],
        employeeDOB: snapshot['dob'],
        employeeContactNumber: snapshot['contact'],
        preferredJobType: snapshot['preferredJob'],
        employeeExpectedJobs: snapshot['expectedJobs'],
        employeeExpectedSalary: snapshot['expectedSalary'],
        employeeExperience: snapshot['experience'],
        employeeName: snapshot['name'],
        employeePreferedShift: snapshot['preferredShift'],
        reviews: snapshot['reiews'],
        aadhar: snapshot['aadhar'],
        isEmployee: snapshot['isEmployee'],
        applications: snapshot['applications'],
        maxSal: snapshot['maxExpSal'],
        minSal: snapshot['minExpSal']);
  }

  //FETCHING Employee
  Stream<Employee> get empData {
    return employeeProfile.doc(uid).snapshots().map(_empFromSnap);
  }

  // ignore: todo
  //TODO:EMPLOYER
  //ADDING and UPDATING Employer
  Future<void> updateEmployerData(
      {String aadhar,
      String employerName,
      String employerAddress,
      String employerContactNumber,
      String employerBio,
      String employerAge,
      String employerDOB,
      double averageRating,
      String shopDesc,
      List<ReviewByEmployer> reviews,
      List<Shop> shops,
      String shopName,
      String city,
      String state,
      bool isEmployer,
      bool isEmployee,
      String shopImg,
      String employerImg}) async {
    return await employerProfile.doc(uid).set(
      {
        'name': employerName,
        'address': employerAddress,
        'contact': employerContactNumber,
        'bio': employerBio,
        'dob': employerDOB,
        'age': employerAge,
        'averageRating': 4.99,
        'aadhar': aadhar,
        'city': city,
        'state': state,
        'isEmployer': isEmployer,
        'isEmployee': isEmployee,
        'shopImg': shopImg,
        'employerImg': employerImg,
      },
    );
  }

  Future<void> updateShop({
    String employerName,
    String shopAddress,
    String employerContactNumber,
    String shopDesc,
    String shopType,
    String shopName,
    String city,
    String state,
    String shopImage,
  }) async {
    return await shops.doc(uid).set(
      {
        'ownerName': employerName,
        'shopAddress': shopAddress,
        'shopName': shopName,
        'shopDesc': shopDesc,
        'city': city,
        'shopType': "Company",
        'shopImgUrl': shopImage,
        'ownerId': uid
      },
    );
  }

//DELETING Employer
  Future<void> deleteEmployer() {
    return employerProfile
        .doc(uid)
        .delete()
        .then((value) => print("$uid Deleted"))
        .catchError(
          (error) => print(
            "Failed to delete user: $error",
          ),
        );
  }

  //DELETING Shop
  Future<void> deleteShop(uid) {
    return shops
        .doc(uid)
        .delete()
        .then((value) => print("$uid Deleted"))
        .catchError(
          (error) => print(
            "Failed to delete user: $error",
          ),
        );
  }

//READING Employer
  Employer _employerFromSnap(DocumentSnapshot snapshot) {
    return Employer(
        uid: uid,
        averageRating: snapshot.get('averageRating'),
        employerAge: snapshot.get('age'),
        employerAddress: snapshot.get('address'),
        employerBio: snapshot.get('bio'),
        employerDOB: snapshot.get('dob'),
        employerContactNumber: snapshot.get('contact'),
        employerName: snapshot.get('name'),
        reviews: snapshot.get('reviews'),
        aadhar: snapshot.get('aadhar'),
        shops: snapshot.get('shops'),
        shopName: snapshot.get('shopName'),
        shopDesc: snapshot.get('shopDesc'),
        city: snapshot.get('city'),
        state: snapshot.get('state'),
        isEmployer: snapshot.get('isEmployer'),
        isEmployee: snapshot.get('isEmployee'),
        shopImg: snapshot.get('shopImg'),
        EmployerImg: snapshot.get('employerImg'));
  }

  //FETCHING Employer
  Stream<Employer> get employerData {
    return employerProfile.doc(uid).snapshots().map(_employerFromSnap);
  }
}
