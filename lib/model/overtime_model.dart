// To parse this JSON data, do
//
//     final overtimeModel = overtimeModelFromJson(jsonString);

import 'dart:convert';

List<OvertimeModel> overtimeModelFromJson(String str) =>
    List<OvertimeModel>.from(
        json.decode(str).map((x) => OvertimeModel.fromJson(x)));

String overtimeModelToJson(List<OvertimeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OvertimeModel {
  OvertimeModel({
    this.id,
    this.userId,
    this.calendarId,
    this.approvedBy,
    this.approverId,
    this.taskPlan,
    this.startTime,
    this.duration,
    this.note,
    this.endTime,
    this.taskReport,
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
  String taskPlan;
  String startTime;
  int duration;
  String note;
  String endTime;
  String taskReport;
  bool isFinished;
  String approvalStatus;
  dynamic rejectionNote;
  DateTime createdAt;
  DateTime updatedAt;

  factory OvertimeModel.fromJson(Map<String, dynamic> json) => OvertimeModel(
        id: json["id"],
        userId: json["user_id"],
        calendarId: json["calendar_id"],
        approvedBy: json["approvedBy"],
        approverId: json["approverId"],
        taskPlan: json["task_plan"],
        startTime: json["start_time"],
        duration: json["duration"],
        note: json["note"],
        endTime: json["end_time"],
        taskReport: json["task_report"] == null ? null : json["task_report"],
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
        "task_plan": taskPlan,
        "start_time": startTime,
        "duration": duration,
        "note": note,
        "end_time": endTime,
        "task_report": taskReport == null ? null : taskReport,
        "isFinished": isFinished,
        "approvalStatus": approvalStatus == null ? null : approvalStatus,
        "rejectionNote": rejectionNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
