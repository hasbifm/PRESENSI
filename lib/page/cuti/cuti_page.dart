import 'package:flutter/material.dart';
import 'package:presensi/controller/cuti_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensi/page/cuti/cuti_dialog.dart';

class Cuti extends StatefulWidget {
  @override
  _CutiState createState() => _CutiState();
}

class _CutiState extends State<Cuti> {
  final CutiController cutiController = Get.put(CutiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.dialog(CutiDialog());
        },
        label: Text("Ajukan Izin"),
      ),
      body: Obx(
        () => cutiController.listCuti.isEmpty
            ? Center(child: Text('Empty'))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text("Tanggal"),
                          title: Text(DateFormat('EEEE, dd-MM-yyyy').format(
                              cutiController.getCutiList()[index].tanggalCuti)),
                        ),
                        ListTile(
                            trailing: Text("alasan"),
                            title: Text(
                                cutiController.getCutiList()[index].alasan)),
                      ],
                    ),
                  );
                },
                itemCount: cutiController.getCutiList().length,
              ),
      ),
    );
  }
}
