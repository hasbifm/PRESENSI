// To parse this JSON data, do
//
//     final absentModel = absentModelFromJson(jsonString);

import 'dart:convert';

List<AbsentModel> absentModelFromJson(String str) => List<AbsentModel>.from(
    json.decode(str).map((x) => AbsentModel.fromJson(x)));

String absentModelToJson(List<AbsentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AbsentModel {
  AbsentModel({
    this.id,
    this.userId,
    this.calendarId,
    this.approvedBy,
    this.approverId,
    this.date,
    this.reason,
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
  DateTime date;
  String reason;
  String approvalStatus;
  dynamic rejectionNote;
  DateTime createdAt;
  DateTime updatedAt;

  factory AbsentModel.fromJson(Map<String, dynamic> json) => AbsentModel(
        id: json["id"],
        userId: json["user_id"],
        calendarId: json["calendar_id"],
        approvedBy: json["approvedBy"],
        approverId: json["approverId"],
        date: DateTime.parse(json["date"]),
        reason: json["reason"],
        approvalStatus: json["approvalStatus"],
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
        "date": date.toIso8601String(),
        "reason": reason,
        "approvalStatus": approvalStatus,
        "rejectionNote": rejectionNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
