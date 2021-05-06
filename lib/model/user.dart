class User {
  int id;
  int role_id;
  int division_office_id;
  int time_setting_id;
  String first_name;
  String last_name;
  String email;
  String password;
  int parent_id;

  User({
    this.id,
    this.role_id,
    this.division_office_id,
    this.time_setting_id,
    this.first_name,
    this.last_name,
    this.email,
    this.password,
    this.parent_id,
  });
}
