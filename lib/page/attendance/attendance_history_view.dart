import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/attendance_controller.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AttendanceController>(builder: (controller) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(DateFormat('EEEE, dd-MM-yyyy')
                      .format(controller.listAttendance[index].clockIn)),
                ),
                ListTile(
                  leading: Text("ClockIn"),
                  trailing:
                      Text(controller.listAttendance[index].clockIn.toString()),
                ),
                ListTile(
                  leading: Text("latitude"),
                  trailing: Text(controller.listAttendance[index].lat),
                ),
                ListTile(
                  leading: Text("longitude"),
                  trailing: Text(controller.listAttendance[index].lot),
                )
              ],
            ),
          );
        },
        itemCount: controller.listAttendance.length,
      );
    });
  }
}
