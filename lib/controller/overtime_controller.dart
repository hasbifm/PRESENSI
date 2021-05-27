import 'package:presensi/model/overtime.dart';
import 'package:get/get.dart';

class OvertimeController extends GetxController {
  RxList<OvertimeModel> listOvertime = <OvertimeModel>[].obs;

  addAttendance(overtime) {
    listOvertime.add(overtime);
  }
}
