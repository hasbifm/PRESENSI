import 'package:flutter/material.dart';

class Overtime extends StatefulWidget {
  @override
  _OvertimeState createState() => _OvertimeState();
}

class _OvertimeState extends State<Overtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Ajukan Lembur"),
        icon: Icon(Icons.alarm_add),
      ),
    );
  }
}
