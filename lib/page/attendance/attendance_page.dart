import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:presensi/page/attendance/attendance_absensi_view.dart';
import 'package:presensi/page/attendance/attendance_history_view.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  String qrCode = "Uknown";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TabBarView(
          children: [AttendanceAbsesnsi(), AttendanceHistory()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        onPressed: () => scanQR(),
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      final qrCodeScan = await FlutterBarcodeScanner.scanBarcode(
        '#FF8C00',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) {
        return;
      }
      setState(() {
        this.qrCode = qrCodeScan;
      });
      Get.snackbar("QR Code", qrCode);
    } on PlatformException {
      qrCode = "Failed to get platform version";
    }
  }
}
