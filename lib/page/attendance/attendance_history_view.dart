import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/attendance_controller.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatelessWidget {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => attendanceController.listAttendance.isEmpty
          ? Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                          leading: Text("calendar id"),
                          title: Text(
                              attendanceController.listAttendance[index].date)),
                      // title: Text("test"),
                      ListTile(
                        leading: Text("ClockIn"),
                        trailing: Text(attendanceController
                                .listAttendance[index].clockIn
                                .toString()
                            // "test"
                            ),
                      ),
                      ListTile(
                        leading: Text("ClockOut"),
                        trailing: Text(attendanceController
                                .listAttendance[index].clockOut
                                .toString()
                            // "test"
                            ),
                      ),
                      ListTile(
                        leading: Text("Task Plan"),
                        trailing: Text(attendanceController
                            .listAttendance[index].taskPlan),
                      ),
                      ListTile(
                        leading: Text("Note"),
                        trailing: Text(
                            attendanceController.listAttendance[index].note),
                      )
                    ],
                  ),
                );
              },
              itemCount: attendanceController.listAttendance.length,
            ),
    );
  }
}
