import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/overtime_controller.dart';
import 'package:presensi/page/overtime/overtime_dialog.dart';

class Overtime extends StatefulWidget {
  @override
  _OvertimeState createState() => _OvertimeState();
}

class _OvertimeState extends State<Overtime> {
  final OvertimeController overtimeController = Get.put(OvertimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.dialog(OvertimeDialog());
          },
          label: Text("Ajukan Lembur"),
          icon: Icon(Icons.alarm_add),
        ),
        body: Obx(() => overtimeController.listOvertime.isEmpty
            ? Center(child: Text("Empty"))
            : ListView.builder(
                itemCount: overtimeController.listOvertime.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("date"),
                          trailing: Text(overtimeController
                              .listOvertime[index].date
                              .toString()),
                        ),
                        ListTile(
                          leading: Text("Overtime Duration"),
                          trailing: Text(
                              overtimeController.listOvertime[index].duration),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
