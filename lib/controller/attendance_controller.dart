import 'package:get/get.dart';
import 'package:presensi/model/attendance.dart';
import 'package:presensi/page/attendance/attendance_page.dart';

class AttendanceController extends GetxController {
  RxList<AttendanceModel> listAttendance = <AttendanceModel>[].obs;

  addAttendance(attendance) {
    listAttendance.add(attendance);
  }
}
