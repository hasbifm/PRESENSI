import 'package:get/get.dart';
import 'package:presensi/model/cuti.dart';

class CutiController extends GetxController {
  var listCuti = List<CutiModel>.empty(growable: true).obs;
  final cuti = CutiModel().obs;

  void setCutiList(List<CutiModel> list) {
    this.listCuti.assignAll(list);
  }

  List<CutiModel> getCutiList() {
    return this.listCuti;
  }

  CutiModel get GetDataCuti => this.cuti.value;

  void addCuti(CutiModel cuti) {
    this.listCuti.add(cuti);
  }
}
