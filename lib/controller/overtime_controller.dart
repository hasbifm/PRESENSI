import 'dart:convert';

import 'package:presensi/model/overtime_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String host = 'http://192.168.20.8:8000';

class OvertimeController extends GetxController {
  RxList<OvertimeModel> listOvertime = <OvertimeModel>[].obs;

  var overtimeUrl = Uri.parse('$host/api/employee/overtimes');
  var updateOvertime = "$host/api/employee/overtimes/";

  @override
  void onInit() {
    getCuti();
    super.onInit();
  }

  Future<void> newOvertime(_duration, _taskPlan, _note) async {
    // print(_date);
    // print(_reason);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.post(
        overtimeUrl,
        body: {'duration': _duration, 'task_plan': _taskPlan, 'note': _note},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 201) {
        var attendanceData = jsonDecode(response.body);
        listOvertime.add(OvertimeModel.fromJson(attendanceData));
        Get.snackbar("Absent", "Absent Success");
        print(attendanceData);
      } else {
        print(response.statusCode);
        Get.snackbar("Absent", "Absent Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCuti() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.get(
        overtimeUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        print(attendanceData);
        for (var data in attendanceData) {
          listOvertime.add(OvertimeModel.fromJson(data));
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateOver(_taskPlan, _note, _taskRepot, _status, id) async {
    print(_taskPlan);
    print(_note);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.put(
        Uri.parse(updateOvertime + id),
        body: {
          'task_plan': _taskPlan,
          'note': _note,
          'task_report': _taskRepot,
          'isFinished': _status,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        Get.snackbar("Edit", "Edit Success");
        listOvertime.clear();
        getCuti();
        print(attendanceData);
      } else {
        print(response.statusCode);
        Get.snackbar("Edit", "Edit Failed");
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future delOvertime(String _id) async {
    print(updateOvertime + '$_id');
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      // isLoading(true);
      print(updateOvertime + _id);
      final response = await http.delete(
        Uri.parse(updateOvertime + _id),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        Get.snackbar("Delete", "Delete Success");
        listOvertime.clear();
        getCuti();
        print(attendanceData);
      } else {
        Get.snackbar("Delete", "Delete Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      // isLoading(false);
    }
  }

  addAttendance(overtime) {
    listOvertime.add(overtime);
  }
}
