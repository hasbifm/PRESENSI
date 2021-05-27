import 'package:flutter/material.dart';
import 'package:presensi/controller/cuti_controller.dart';
import 'package:presensi/model/cuti.dart';
import 'package:presensi/page/cuti/cuti_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CutiDialog extends StatefulWidget {
  @override
  _CutiDialogState createState() => _CutiDialogState();
}

class _CutiDialogState extends State<CutiDialog> {
  CutiController cutiController = Get.put(CutiController());
  final _formKey = GlobalKey<FormState>();
  String inAlasan = "";
  DateTime dateStart = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Cuti"),
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
                    value == null ? dateStart = dateStart : dateStart = value;
                  });
                });
              },
              child: Text(DateFormat("dd-MM-yyyy").format(dateStart)),
            ),
            leading: Text("Tanggal"),
          ),
          CutiForm(
            onChangedAlasan: (inputAlasan) =>
                setState(() => inAlasan = inputAlasan),
            onSaved: () => tambahCuti(context),
            onCancel: () => Get.back(),
          ),
        ],
      )),
    );
  }

  void tambahCuti(context) {
    // final isValid = _formKey.currentState.validate();
    // if (!isValid) {
    //   return;
    // } else {
    final cuti = CutiModel(
      tanggalCuti: dateStart,
      alasan: inAlasan,
    );
    print(cuti.tanggalCuti);
    print(cuti.alasan);
    Get.back();
    cutiController.addCuti(cuti);
    // }
  }
}
