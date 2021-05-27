import 'package:flutter/material.dart';

class AttendanceModel {
  String date;
  String taskPlan;
  String note;
  String clockIn;
  String clockOut;
  String lat;
  String lot;
  int status;
  bool isApproved;

  AttendanceModel({
    this.date,
    this.taskPlan,
    this.note,
    this.clockIn,
    this.lat,
    this.lot,
    this.isApproved,
    this.status,
  });

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    json['calendar_id'] != null
        ? date = json['calendar_id'].toString()
        : date = "empty";

    json['task_plan'] != null
        ? taskPlan = json['task_plan']
        : taskPlan = "empty";

    json['note'] != null ? note = json['note'] : note = "empty";

    json['clock_in_time'] != null
        ? clockIn = json['clock_in_time'].toString()
        : clockIn = "empty";

    json['clock_out_time'] != null
        ? clockOut = json['clock_out_time'].toString()
        : clockOut = "empty";
  }
}
