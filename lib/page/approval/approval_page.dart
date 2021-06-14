import 'package:flutter/material.dart';
import 'package:presensi/page/approval/approval_attendance_view.dart';
import 'package:presensi/page/approval/approval_cuti_view.dart';
import 'package:presensi/page/approval/approval_overtime_view.dart';
import 'package:presensi/page/attendance/attendance_absensi_view.dart';

class Approval extends StatefulWidget {
  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          ApprovalAttendance(),
          ApprovalOvertime(),
          ApprovalCuti(),
        ],
      ),
    );
  }
}
