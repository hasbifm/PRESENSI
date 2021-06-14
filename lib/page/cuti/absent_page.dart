import 'package:flutter/material.dart';
import 'package:presensi/controller/absent_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'absent_dialog.dart';

class Absent extends StatefulWidget {
  @override
  _AbsentState createState() => _AbsentState();
}

class _AbsentState extends State<Absent> {
  final CutiController cutiController = Get.put(CutiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.dialog(AbsentDialog());
        },
        label: Text("Ajukan Izin"),
      ),
      body: Obx(
        () => cutiController.listCuti.isEmpty
            ? Center(child: Text('Empty'))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Date"),
                            subtitle: Text(cutiController
                                .getCutiList()[index]
                                .calendarId
                                .toString()),
                          ),
                          ListTile(
                              title: Text("Reason"),
                              subtitle: Text(
                                  cutiController.getCutiList()[index].reason)),
                          ListTile(
                            title: Text("Approval Status"),
                            subtitle: Text(cutiController
                                .getCutiList()[index]
                                .approvalStatus),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: cutiController.getCutiList().length,
              ),
      ),
    );
  }
}
