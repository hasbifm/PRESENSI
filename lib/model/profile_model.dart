class ProfileModel {
  int id_role;
  int division_office_id;
  int time_setting_id;
  String first_name;
  String last_name;
  String email;
  bool isAutoApproved;
  int parent_id;

  ProfileModel({
    this.id_role,
    this.division_office_id,
    this.time_setting_id,
    this.first_name,
    this.last_name,
    this.email,
    this.isAutoApproved,
    this.parent_id,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    json['id_role'] == null ? id_role = 0 : id_role = json['id_role'];

    json['division_office_id'] == null
        ? division_office_id = 0
        : division_office_id = json['division_office_id'];

    json['time_setting_id'] == null
        ? time_setting_id = 0
        : time_setting_id = json['time_setting_id'];

    json['first_name'] == null
        ? first_name = ""
        : first_name = json['first_name'];

    json['last_name'] == null ? last_name = "" : last_name = json['last_name'];

    email = json['email'];
    isAutoApproved = json['isAutoApproved'];
    parent_id = json['parent_id'];
  }
}
