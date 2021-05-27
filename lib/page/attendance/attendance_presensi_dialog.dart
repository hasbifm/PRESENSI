import 'package:flutter/material.dart';
import 'package:presensi/controller/attendance_controller.dart';
import 'package:presensi/model/attendance.dart';
import 'package:presensi/page/attendance/attendance_prensensi_form.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class PresensiDialog extends StatefulWidget {
  @override
  _PresensiDialogState createState() => _PresensiDialogState();
}

class _PresensiDialogState extends State<PresensiDialog> {
  final attendacneController = Get.put(AttendanceController());
  final _formKey = GlobalKey<FormState>();
  String inTaskPlan = "";
  String inNote = "";
  double inLat = 0.0;
  double inLot = 0.0;

  @override
  void initState() {
    super.initState();
    location();
  }

  location() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    inLat = _locationData.latitude;
    inLot = _locationData.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Form Presensi"),
            PresensiForm(
              onChangedTaskPlan: (inputTaskPlan) =>
                  setState(() => inTaskPlan = inputTaskPlan),
              onChangedNote: (inputNote) => setState(() => inNote = inputNote),
              onSaved: () => addPresensi(context),
              onCancel: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }

  void addPresensi(context) {
    location();
    // final isValid = _formKey.currentState.validate();
    // if (!isValid) {
    //   return;
    // } else {
    final presensi = AttendanceModel(
      taskPlan: inTaskPlan,
      note: inNote,
      status: 1,
      isApproved: false,
      clockIn: DateTime.now().toString(),
      // overtimeDuration: DateTimeRange(
      //   start: DateTime(DateTime.monthsPerYear, DateTime.monthsPerYear,
      //       DateTime.daysPerWeek, 8, 0, 0, 0, 0),
      //   end: DateTime.now(),
      // ),
      // isOvertime: checkLate(),
      lat: inLat.toString(),
      lot: inLot.toString(),
    );
    Get.back();
    // attendacneController.addAttendance(presensi);
    attendacneController.newAttendance(inTaskPlan, inNote);
    // }
  }

  checkLate() {
    final time = DateTime.now();
    if (time.compareTo(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 8, 0, 0, 0, 0)) >
        0) {
      return true;
    } else {
      return false;
    }
  }
}
