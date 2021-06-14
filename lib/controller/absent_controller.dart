import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/model/absent_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String host = 'http://192.168.20.8:8000';

class CutiController extends GetxController {
  var listCuti = List<AbsentModel>.empty(growable: true).obs;
  final cuti = AbsentModel().obs;

  var absentUrl = Uri.parse('$host/api/employee/absents');

  @override
  void onInit() {
    getCuti();
    super.onInit();
  }

  Future<void> newAttendance(_date, _reason) async {
    print(_date);
    print(_reason);

    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    try {
      final response = await http.post(
        absentUrl,
        body: {'date': _date, 'reason': _reason},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 201) {
        var attendanceData = jsonDecode(response.body);
        listCuti.add(AbsentModel.fromJson(attendanceData));
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
        absentUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var attendanceData = jsonDecode(response.body);
        print(attendanceData);
        for (var data in attendanceData) {
          listCuti.add(AbsentModel.fromJson(data));
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void setCutiList(List<AbsentModel> list) {
    this.listCuti.assignAll(list);
  }

  List<AbsentModel> getCutiList() {
    return this.listCuti;
  }

  AbsentModel get GetDataCuti => this.cuti.value;

  void addCuti(AbsentModel cuti) {
    this.listCuti.add(cuti);
  }
}
