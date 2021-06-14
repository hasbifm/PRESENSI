// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.roleId,
    this.divisionOfficeId,
    this.timeSettingId,
    this.firstName,
    this.lastName,
    this.email,
    this.isAutoApproved,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int roleId;
  int divisionOfficeId;
  int timeSettingId;
  String firstName;
  String lastName;
  String email;
  bool isAutoApproved;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        roleId: json["role_id"],
        divisionOfficeId: json["division_office_id"],
        timeSettingId: json["time_setting_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isAutoApproved: json["isAutoApproved"],
        parentId: json["parent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "division_office_id": divisionOfficeId,
        "time_setting_id": timeSettingId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "isAutoApproved": isAutoApproved,
        "parent_id": parentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
