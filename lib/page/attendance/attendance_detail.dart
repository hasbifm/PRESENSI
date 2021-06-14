import 'package:flutter/material.dart';
import 'package:presensi/controller/attendance_controller.dart';
import 'package:get/get.dart';

import 'attendance_prensensi_form.dart';

class AttendanceDetail extends StatefulWidget {
  @override
  _AttendanceDetailState createState() => _AttendanceDetailState();
}

class _AttendanceDetailState extends State<AttendanceDetail> {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  RxBool taskPlanEdit = false.obs;
  RxBool taskReportEdit = false.obs;
  RxBool taskNoteEdit = false.obs;

  String taskPlan = "";
  String note = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.indigo[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Text("Date"),
                subtitle: Obx(
                  () => Text(attendanceController
                      .attendanceById.value.calendarId
                      .toString()),
                ),
              ),
              ListTile(
                title: Text("Clock-In Time"),
                subtitle: Obx(
                  () => Text(attendanceController
                      .attendanceById.value.clockInTime
                      .toString()),
                ),
              ),
              ListTile(
                title: Text("Clock-Out Time"),
                subtitle: Obx(
                  () => Text(attendanceController
                      .attendanceById.value.clockOutTime
                      .toString()),
                ),
              ),
              ListTile(
                title: Column(children: [
                  taskPlanEdit.value == false
                      ? Obx(() => Text(
                          attendanceController.attendanceById.value.taskPlan))
                      : TextField(
                          controller: attendanceController.taskPlan,
                          decoration: InputDecoration(hintText: 'Task Plan'),
                        ),
                ]),
                trailing: Column(
                  children: [
                    taskPlanEdit.value == false
                        ? IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                            onPressed: () => taskPlanEdit.value = true)
                        : IconButton(
                            icon: Icon(Icons.cancel),
                            color: Colors.red,
                            onPressed: () => taskPlanEdit.value = false),
                  ],
                ),
              ),
              TextField(
                controller: attendanceController.taskReport,
                decoration: InputDecoration(hintText: 'Task Report'),
              ),
              TextField(
                controller: attendanceController.note,
                decoration: InputDecoration(hintText: 'Note'),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "edit",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  editAttendance(id) {
    Get.dialog(dialogedit(id));
  }

  dialogedit(id) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text(
          "Presensi",
          textAlign: TextAlign.center,
        ),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              PresensiForm(
                onChangedTaskPlan: (inputTaskPlan) =>
                    setState(() => taskPlan = inputTaskPlan),
                onChangedNote: (inputNote) => setState(() => note = inputNote),
                onSaved: () {
                  Get.back();
                  attendanceController.updateAttendance(
                      taskPlan, note, "test", "1", id);
                },
                onCancel: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  deleteAttendance(String id) {
    Get.back();
    attendanceController.delAttendance(id);
  }
}
