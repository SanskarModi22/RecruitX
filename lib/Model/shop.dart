import 'package:flutter/material.dart';
import 'package:helping_hand/Model/job.dart';

class Shop {
  String city;
  String shopid;
  String userid;
  String shopName;
  String ownerName;
  String shopType;
  String numOfEmployees;
  String shopAddress;
  String shopImageUrl;
  List<Job> jobsAvailable = [];
  Shop({
    this.userid,
    @required this.shopid,
    @required this.shopName,
    @required this.numOfEmployees,
    @required this.ownerName,
    @required this.shopAddress,
    @required this.shopType,
    this.jobsAvailable,
    this.shopImageUrl,
   this.city,
  });
}
