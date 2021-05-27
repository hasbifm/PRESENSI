import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/auth_controller.dart';
import 'package:presensi/page/attendance/attendance_presensi_dialog.dart';

class AttendanceAbsesnsi extends StatefulWidget {
  @override
  _AttendanceAbsesnsiState createState() => _AttendanceAbsesnsiState();
}

class _AttendanceAbsesnsiState extends State<AttendanceAbsesnsi> {
  final authcontroller = Get.put(AuthController());
  String qrCode = "Uknown";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jam Masuk",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "08.00 WIB",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                child: Text("Konfirmasi"),
                onPressed: () {
                  Get.dialog(
                    PresensiDialog(),
                    barrierDismissible: false,
                    useSafeArea: true,
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ),
            Divider(),
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jam Keluar",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "17.00 WIB",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                child: Text("Konfirmasi"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: logout,
              ),
            ),
            Divider(),
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Belum melakukan Absensi",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    authcontroller.logOut();
  }
}
