import 'package:flutter/material.dart';
import 'package:presensi/controller/overtime_controller.dart';
import 'package:get/get.dart';
import 'package:presensi/model/overtime_model.dart';
import 'package:presensi/page/attendance/attendance_prensensi_form.dart';

class OvertimeDetail extends StatefulWidget {
  final OvertimeModel overtimeModel;

  const OvertimeDetail(OvertimeModel model, {Key key, this.overtimeModel})
      : super(key: key);

  @override
  _OvertimeDetailState createState() => _OvertimeDetailState();
}

class _OvertimeDetailState extends State<OvertimeDetail> {
  final OvertimeController overtimeController = Get.put(OvertimeController());
  String taskPlan = "";
  String note = "";
  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          backgroundColor: Colors.indigo[700],
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                title: Text("Date"),
                subtitle: Text(widget.overtimeModel.calendarId.toString()),
              ),
              ListTile(
                title: Text("Start Time"),
                subtitle: Text(widget.overtimeModel.startTime),
              ),
              ListTile(
                title: Text("Overtime Duration"),
                subtitle: Text(widget.overtimeModel.duration.toString()),
              ),
              ListTile(
                title: Text("End Time"),
                subtitle: Text(widget.overtimeModel.endTime),
              ),
              ListTile(
                title: Text("Task Plan"),
                subtitle: Text(widget.overtimeModel.taskPlan),
              ),
              ListTile(
                title: Text("Task Report"),
                subtitle: Text(widget.overtimeModel.taskReport),
              ),
              ListTile(
                title: Text("Task Report"),
                subtitle: Text(widget.overtimeModel.note),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => editOvertime(widget.overtimeModel.id),
                    child: Text(
                      "edit",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () => deleteOvertime(widget.overtimeModel.id),
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
      );
    }
  }

  deleteOvertime(id) {
    Get.back();
    overtimeController.delOvertime(id);
  }

  editOvertime(id) {
    Get.dialog(getDialog(id));
  }

  getDialog(id) {
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
                  overtimeController.updateOver(
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
}
