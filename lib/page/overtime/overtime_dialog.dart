import 'package:flutter/material.dart';
import 'package:presensi/controller/overtime_controller.dart';
import 'package:presensi/model/overtime.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OvertimeDialog extends StatefulWidget {
  @override
  _OvertimeDialogState createState() => _OvertimeDialogState();
}

class _OvertimeDialogState extends State<OvertimeDialog> {
  final OvertimeController overtimeController = Get.put(OvertimeController());

  final List<String> items = <String>['1', '2', '3'];
  String selectedItem = '1';

  var timeStart = TimeOfDay.now();
  var timeEnd = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Overtime"),
            Text(DateFormat('EEEE, dd-MM-yyyy').format(DateTime.now())),
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
            // widgetDropdown(),
            widgetBuildButton(),
          ],
        ),
      ),
    );
  }

  widgetDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton<String>(
        value: selectedItem,
        onChanged: (String string) => setState(() => selectedItem = string),
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((String item) {
            return Text(item);
          }).toList();
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            child: Text('$item hour'),
            value: item,
          );
        }).toList(),
      ),
    );
  }

  widgetBuildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text("Cancel"),
          style: ElevatedButton.styleFrom(primary: Colors.redAccent),
        ),
        ElevatedButton(
          onPressed: addToOvertime,
          child: Text("Save"),
          style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
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
      date: DateTime.now(),
      // startTime: timeStart,
      // endTime: timeEnd,
      duration: selectedItem + " hour",
    );
    Get.back();
    overtimeController.addAttendance(overtime);
  }
}
