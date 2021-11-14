import 'package:flutter/material.dart';

class Job {
  String shopId;
  String ownerId;
  String jobId;
  String jobName;
  String salary;
  String workingHours;
  String workingDays;
  String specialRequest;
String vacancy;
  Job({
    @required this.jobId,
    @required this.jobName,
    @required this.salary,
    @required this.workingDays,
    @required this.workingHours,
    this.specialRequest,
    this.ownerId,
    this.shopId,
    this.vacancy,
  });
}
