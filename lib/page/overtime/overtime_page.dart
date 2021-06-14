import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/controller/overtime_controller.dart';
import 'package:presensi/model/overtime_model.dart';
import 'package:presensi/page/overtime/overtime_dialog.dart';

import 'overtime_detail.dart';

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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => getOvertimeDetail(
                          overtimeController.listOvertime[index]),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("date"),
                              subtitle: Text(overtimeController
                                  .listOvertime[index].calendarId
                                  .toString()),
                            ),
                            ListTile(
                              title: Text("Overtime Duration"),
                              subtitle: Text(overtimeController
                                  .listOvertime[index].duration
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }

  getOvertimeDetail(OvertimeModel model) {
    return Get.to(OvertimeDetail(model));
  }
}
