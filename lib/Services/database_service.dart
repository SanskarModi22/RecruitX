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

  //TODO:EMPLOYEE
  //ADD and UPDATE Employee
  Future<void> updateEmployeeData(
    String aadhar,
    String employeeName,
    String employeeAddress,
    String employeeContactNumber,
    String employeeBio,
    String employeeAge,
    String employeeDOB,
    String employeeExperience,
    String employeeExpectedSalary,
    String employeeExpectedJobs,
    String currentlyWorkingAt,
    String preferredJobType,
    String employeePreferedShift,
    double averageRating,
    List<ReviewByEmployer> reviews,
  ) async {
    return await employeeProfile.doc(uid).set(
      {
        'name': employeeName,
        'address': employeeAddress,
        'contact': employeeContactNumber,
        'bio': employeeBio,
        'dob': employeeDOB,
        'age': employeeAge,
        'experience': employeeExperience,
        'expectedSalary': employeeExpectedSalary,
        'expectedJobs': employeeExpectedJobs,
        'currentWork': currentlyWorkingAt,
        'preferredJob': preferredJobType,
        'preferredShift': employeePreferedShift,
        'averageRating': averageRating,
        'reviews': reviews,
        'aadhar': aadhar,
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
      uid: uid,
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
    );
  }

  //FETCHING Employee
  Stream<Employee> getempData() {
    return employeeProfile.doc(uid).snapshots().map(_empFromSnap);
  }

  //TODO:EMPLOYER
  //ADDING and UPDATING Employer
  Future<void> updateEmployerData(
      String aadhar,
    String employerName,
    String employerAddress,
    String employerContactNumber,
    String employerBio,
    String employerAge,
    String employerDOB,
    double averageRating,
    List<ReviewByEmployer> reviews,
    List<Shop> shops,
  ) async {
    return await employerProfile.doc(uid).set(
      {
        'name': employerName,
        'address': employerAddress,
        'contact': employerContactNumber,
        'bio': employerBio,
        'dob': employerDOB,
        'age': employerAge,
        'averageRating': averageRating,
        'reviews': reviews,
        'shops': shops,
        'aadhar': aadhar,
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

//READING Employer
  Employer _employerFromSnap(DocumentSnapshot snapshot) {
    return Employer(
      uid: uid,
      averageRating: snapshot['averageRating'],
      employerAge: snapshot['age'],
      employerAddress: snapshot['address'],
      employerBio: snapshot['bio'],
      employerDOB: snapshot['dob'],
      employerContactNumber: snapshot['contact'],
      employerName: snapshot['name'],
      reviews: snapshot['reviews'],
      aadhar: snapshot['aadhar'],
      shops: snapshot['shops']
    );
  }

  //FETCHING Employer
  Stream <Employer> getemployerData() {
    return employerProfile.doc(uid).snapshots().map(_employerFromSnap);
  }
}
