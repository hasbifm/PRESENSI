import 'package:flutter/material.dart';

class ApprovalModel {
  String taskPlan;
  String note;
  DateTime clockIn;
  String lat;
  String lot;
  bool isOvertime;
  int status;
  DateTimeRange overtimeDuration;
  bool isApproved;

  ApprovalModel({
    this.taskPlan,
    this.note,
    this.clockIn,
    this.lat,
    this.lot,
    this.isOvertime,
    this.isApproved,
    this.status,
    this.overtimeDuration,
  });
}
