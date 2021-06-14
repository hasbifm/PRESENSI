import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/attendance_controller.dart';
import 'package:intl/intl.dart';
import 'package:presensi/model/attendance_model.dart';
import 'package:presensi/page/attendance/attendance_detail.dart';

class AttendanceHistory extends StatelessWidget {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  Future<void> _refresh() async {
    attendanceController.getAttendance();
  }

  Future<void> _select(int id) async {
    attendanceController.id.value = id;
    attendanceController.goToDetail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView(
                    children: attendanceController.listAttendance.map((e) {
                      var index =
                          attendanceController.listAttendance.indexOf(e);
                      index++;
                      return Container(
                          child: GestureDetector(
                        onTap: () => _select(e.id),
                        child: buildItem(index, e),
                      ));
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        // attendanceController.listAttendance.isEmpty
        //     ? Center(
        //         child: Text("Empty"),
        //       )
        //     : attendanceController.loading.isTrue
        //         ? Center(
        //             child: CircularProgressIndicator(),
        //           )
        //         : ListView.builder(
        //             itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: GestureDetector(
        //                   onTap: () => getAttendance(
        //                       attendanceController.listAttendance[index]),
        //                   child: Card(
        //                     child: Column(
        //                       children: [
        //                         ListTile(
        //                             title: Text("calendar id"),
        //                             subtitle: Text(attendanceController
        //                                 .listAttendance[index].calendarId
        //                                 .toString())),
        //                         // title: Text("test"),
        //                         ListTile(
        //                           title: Text("ClockIn"),
        //                           subtitle: Text(attendanceController
        //                                   .listAttendance[index].clockInTime
        //                                   .toString()
        //                               // "test"
        //                               ),
        //                         ),
        //                         ListTile(
        //                           title: Text("ClockOut"),
        //                           subtitle: Text(attendanceController
        //                                   .listAttendance[index].clockOutTime
        //                                   .toString()
        //                               // "test"
        //                               ),
        //                         ),
        //                         ListTile(
        //                           title: Text("Task Plan"),
        //                           subtitle: Text(attendanceController
        //                               .listAttendance[index].taskPlan),
        //                         ),
        //                         ListTile(
        //                           title: Text("Note"),
        //                           subtitle: Text(attendanceController
        //                               .listAttendance[index].note),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },
        //             itemCount: attendanceController.listAttendance.length,
        //           ),
      ),
    );
  }

  buildItem(index, e) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
                title: Text("calendar id"),
                subtitle: Text(e.calendarId.toString())),
            // title: Text("test"),
            ListTile(
              title: Text("ClockIn"),
              subtitle: Text(e.clockInTime.toString()
                  // "test"
                  ),
            ),
            ListTile(
              title: Text("ClockOut"),
              subtitle: Text(e.clockOutTime.toString()
                  // "test"
                  ),
            ),
            ListTile(
              title: Text("Task Plan"),
              subtitle: Text(e.taskPlan),
            ),
            ListTile(
              title: Text("Note"),
              subtitle: Text(e.note),
            )
          ],
        ),
      ),
    );
  }
}
