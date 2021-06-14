// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceModel> attendanceModelFromJson(String str) =>
    List<AttendanceModel>.from(
        json.decode(str).map((x) => AttendanceModel.fromJson(x)));

String attendanceModelToJson(List<AttendanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceModel {
  AttendanceModel({
    this.id,
    this.userId,
    this.calendarId,
    this.approvedBy,
    this.approverId,
    this.isQrCode,
    this.gpsLat,
    this.gpsLong,
    this.taskPlan,
    this.clockInTime,
    this.note,
    this.taskReport,
    this.clockOutTime,
    this.isFinished,
    this.approvalStatus,
    this.rejectionNote,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int calendarId;
  String approvedBy;
  int approverId;
  bool isQrCode;
  dynamic gpsLat;
  dynamic gpsLong;
  String taskPlan;
  String clockInTime;
  String note;
  String taskReport;
  String clockOutTime;
  bool isFinished;
  String approvalStatus;
  dynamic rejectionNote;
  DateTime createdAt;
  DateTime updatedAt;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json["id"],
        userId: json["user_id"],
        calendarId: json["calendar_id"],
        approvedBy: json["approvedBy"],
        approverId: json["approverId"],
        isQrCode: json["isQRCode"],
        gpsLat: json["gps_lat"],
        gpsLong: json["gps_long"],
        taskPlan: json["task_plan"],
        clockInTime: json["clock_in_time"],
        note: json["note"],
        taskReport: json["task_report"] == null ? null : json["task_report"],
        clockOutTime:
            json["clock_out_time"] == null ? null : json["clock_out_time"],
        isFinished: json["isFinished"],
        approvalStatus:
            json["approvalStatus"] == null ? null : json["approvalStatus"],
        rejectionNote: json["rejectionNote"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "calendar_id": calendarId,
        "approvedBy": approvedBy,
        "approverId": approverId,
        "isQRCode": isQrCode,
        "gps_lat": gpsLat,
        "gps_long": gpsLong,
        "task_plan": taskPlan,
        "clock_in_time": clockInTime,
        "note": note,
        "task_report": taskReport == null ? null : taskReport,
        "clock_out_time": clockOutTime == null ? null : clockOutTime,
        "isFinished": isFinished,
        "approvalStatus": approvalStatus == null ? null : approvalStatus,
        "rejectionNote": rejectionNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
