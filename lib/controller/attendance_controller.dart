import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi/model/attendance.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceController extends GetxController {
  RxList<AttendanceModel> listAttendance = <AttendanceModel>[].obs;
  var attendanceUrl =
      Uri.parse('http://192.168.20.4:8000/api/employee/attendances');
  var QrAttendance =
      'http://192.168.20.4:8000/web/employee/QRCode/save_attendance/';

  @override
  void onInit() {
    getAttendance();
    super.onInit();
  }

  addAttendance(attendance) {
    listAttendance.add(attendance);
  }

  Future<void> newAttendance(_taskPlan, _note) async {
    print(_taskPlan);
    print(_note);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.post(
        attendanceUrl,
        body: {'task_plan': _taskPlan, 'note': _note},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 201) {
        var attendanceData = jsonDecode(response.body);
        Get.snackbar("Attendance", "Attendance Success");
        print(attendanceData);
      } else {
        print(response.statusCode);
        Get.snackbar("Attendance", "Attendance Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAttendance() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.get(
        attendanceUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        print(attendanceData);
        for (var data in attendanceData) {
          listAttendance.add(AttendanceModel.fromJson(data));
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> qrLogin(String qrCode) async {
    print(qrCode);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.post(
        Uri.parse(qrCode),
        body: {'task_plan': "_taskPlan", 'note': "_note"},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 201) {
        var attendanceData = jsonDecode(response.body);
        print(attendanceData);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
