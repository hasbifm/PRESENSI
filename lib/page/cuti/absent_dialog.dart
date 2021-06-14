import 'package:flutter/material.dart';
import 'package:presensi/controller/absent_controller.dart';
import 'package:presensi/model/absent_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'absent_form.dart';

class AbsentDialog extends StatefulWidget {
  @override
  _AbsentDialogState createState() => _AbsentDialogState();
}

class _AbsentDialogState extends State<AbsentDialog> {
  CutiController cutiController = Get.put(CutiController());
  final _formKey = GlobalKey<FormState>();
  String inAlasan = "";
  DateTime dateStart = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            "Cuti",
            textAlign: TextAlign.center,
          ),
          content: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              ListTile(
                trailing: ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      setState(() {
                        value == null
                            ? dateStart = dateStart
                            : dateStart = value;
                      });
                    });
                  },
                  child: Text(DateFormat("dd-MM-yyyy").format(dateStart)),
                ),
                leading: Text("Tanggal"),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AbsentForm(
                  onChangedAlasan: (inputAlasan) =>
                      setState(() => inAlasan = inputAlasan),
                  onSaved: () => tambahCuti(context),
                  onCancel: () => Get.back(),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void tambahCuti(context) {
    // final isValid = _formKey.currentState.validate();
    // if (!isValid) {
    //   return;
    // } else {
    final cuti = AbsentModel(
      date: dateStart,
      reason: inAlasan,
    );
    print(cuti.date);
    print(cuti.reason);
    Get.back();
    cutiController.newAttendance(cuti.date, cuti.reason);
    // }
  }
}
