import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi/api/Request.dart';
import 'package:presensi/model/attendance_model.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/page/attendance/attendance_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

String host = 'http://192.168.20.8:8000';

class AttendanceController extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingId = false.obs;
  Map<String, dynamic> body;
  RxList<AttendanceModel> listAttendance = <AttendanceModel>[].obs;
  Rx<AttendanceModel> attendanceById = AttendanceModel().obs;
  RxInt id = 0.obs;

  RxString calendarId = "0".obs;
  RxString clockInTime = "00.00".obs;
  RxString clockOutTime = "00.00".obs;
  TextEditingController taskPlan = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController taskReport = TextEditingController();

  var attendanceUrl = Uri.parse('$host/api/employee/attendances');
  var leavesUrl = Uri.parse('$host/api/employee/leaves');
  var QrAttendance = '$host/web/employee/QRCode/save_attendance/';
  var updateurl = '$host/api/employee/attendances/';

  @override
  void onInit() {
    getAttendance();
    super.onInit();
  }

  addAttendance(attendance) async {
    listAttendance.add(attendance);
  }

  void newAttendance(_taskPlan, _note) {
    print(_taskPlan);
    print(_note);

    Request request = Request(
        url: 'employee/attendances',
        body: {'task_plan': _taskPlan, 'note': _note});
    request.post().then((value) {
      if (value.statusCode == 201) {
        getAttendance();
      } else {
        Get.snackbar("Add new Attendance", "Add new Attendance Fail");
      }
    });
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // var token = pref.getString('token');
    // try {
    //   final response = await http.post(
    //     attendanceUrl,
    //     headers: {'Authorization': 'Bearer $token'},
    //   );
    //   if (response.statusCode == 201) {
    //     var attendanceData = jsonDecode(response.body);
    //     Get.snackbar("Attendance", "Attendance Success");
    //     print(attendanceData);
    //   } else {
    //     print(response.statusCode);
    //     Get.snackbar("Attendance", "Attendance Failed");
    //   }
    // } catch (e) {
    //   print(e);
    // } finally {}
  }

  void getAttendance() async {
    Request request = Request(url: 'employee/attendances');
    request.get().then((value) {
      loading.value = false;
      if (value.statusCode == 200) {
        List jsonResponse = jsonDecode(value.body);
        listAttendance.assignAll(
            jsonResponse.map((e) => AttendanceModel.fromJson(e)).toList());
        loading.value = true;
      } else {
        print("Error");
      }
    }).catchError((onError) {
      printError();
    });
  }

  void getAttendanceById(int id) async {
    Request request = Request(url: 'employee/attendances/${id.toString()}');
    request.get().then((value) {
      loadingId.value = false;
      if (value.statusCode == 200) {
        // body = jsonDecode(value.body);
        print(body);
        attendanceById.value = AttendanceModel.fromJson(jsonDecode(value.body));
        print(attendanceById.value);
        if (attendanceById.value != null) {
          attendanceById.map((e) {
            taskPlan.text = e.taskPlan.toString();
            note.text = e.note.toString();
            taskReport.text = e.taskReport.toString();
          });
          loadingId.value = true;
        }
      } else {
        print("Error");
      }
    }).catchError((onError) {
      printError();
    });
  }

  void goToDetail() async {
    getAttendanceById(id.value);
    Get.to(() => AttendanceDetail());
  }

  Future<void> updateAttendance(
      _taskPlan, _note, _taskRepot, _status, id) async {
    print(_taskPlan);
    print(_note);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.put(
        Uri.parse(updateurl + id),
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
        getAttendance();
        print(attendanceData);
      } else {
        print(response.statusCode);
        Get.snackbar("Edit", "Edit Failed");
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future delAttendance(String _id) async {
    print(updateurl + '$_id');
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      // isLoading(true);
      print(updateurl + _id);
      final response = await http.delete(
        Uri.parse(updateurl + _id),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        Get.snackbar("Delete", "Delete Success");
        listAttendance.clear();
        getAttendance();
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

  Future<void> newLeaves(_startDate, _endDate, _note) async {
    print(_startDate);
    print(_endDate);
    print(_note);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.post(
        leavesUrl,
        body: {'start_date': _startDate, 'end_date': _endDate, 'note': _note},
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

  Future<void> getLeaves() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.get(
        leavesUrl,
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
