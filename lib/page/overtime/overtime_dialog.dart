import 'package:flutter/material.dart';
import 'package:presensi/controller/overtime_controller.dart';
import 'package:presensi/model/overtime_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OvertimeDialog extends StatefulWidget {
  @override
  _OvertimeDialogState createState() => _OvertimeDialogState();
}

class _OvertimeDialogState extends State<OvertimeDialog> {
  final OvertimeController overtimeController = Get.put(OvertimeController());

  final List<int> items = <int>[1, 2, 3];
  int selectedItem = 1;

  var alasan = "";
  var note = "";
  var timeStart = TimeOfDay.now();
  var timeEnd = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            "Overtime",
            textAlign: TextAlign.center,
          ),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Text("Date"),
                  trailing: Text(
                      DateFormat('EEEE, dd-MM-yyyy').format(DateTime.now())),
                ),

                // ListTile(
                //   trailing: ElevatedButton(
                //     onPressed: () {
                //       showTimePicker(
                //         context: context,
                //         initialTime: TimeOfDay.now(),
                //       ).then((value) => setState(() {
                //             timeStart = value;
                //             print(timeStart);
                //           }));
                //     },
                //     child: Text(timeStart.format(context)),
                //   ),
                //   leading: Text("Pilih Jam"),
                // ),
                ListTile(
                  leading: Text("Durasi"),
                  trailing: widgetDropdown(),
                ),
                widgetBuildAlasan(),
                widgetBuildNote(),
                // widgetDropdown(),
                widgetBuildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  widgetBuildAlasan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        initialValue: alasan,
        validator: (inAlasan) {
          if (inAlasan.isEmpty) {
            return "Alasan harus diisi";
          } else {
            return null;
          }
        },
        onChanged: (inputAlasan) => setState(() => alasan = inputAlasan),
        maxLines: 2,
        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: "Task Plan"),
      ),
    );
  }

  widgetBuildNote() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        initialValue: note,
        validator: (inAlasan) {
          if (inAlasan.isEmpty) {
            return "Alasan harus diisi";
          } else {
            return null;
          }
        },
        onChanged: (inputAlasan) => setState(() => note = inputAlasan),
        maxLines: 2,
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: "Note"),
      ),
    );
  }

  widgetDropdown() {
    return DropdownButton<int>(
      isDense: true,
      value: selectedItem,
      onChanged: (int string) => setState(() => selectedItem = string),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((int item) {
          return Text(item.toString());
        }).toList();
      },
      items: items.map((int item) {
        return DropdownMenuItem<int>(
          child: Text('$item hour'),
          value: item,
        );
      }).toList(),
    );
  }

  widgetBuildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: Text("Cancel"),
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: addToOvertime,
            child: Text("Save"),
            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
          ),
        ),
      ],
    );
  }

  void addToOvertime() {
    // var _timeStarttoInt = timeStart.hour + timeStart.minute / 60;
    // var _timeEndtoInt = timeEnd.hour + timeEnd.minute / 60;
    // var _timeDiff = _timeEndtoInt - _timeStarttoInt;
    // var _hourDiff = _timeDiff.truncate();
    // var _minDiff = (_timeDiff.abs() - _hourDiff.abs()) * 60;
    // var dura = TimeOfDay(hour: _hourDiff, minute: _minDiff.truncate());

    final overtime = OvertimeModel(
      // date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      // startTime: timeStart,
      // endTime: timeEnd,
      taskPlan: alasan,
      note: note,
      duration: selectedItem,
    );
    Get.back();
    overtimeController.newOvertime(
        overtime.duration, overtime.taskPlan, overtime.note);
  }
}
