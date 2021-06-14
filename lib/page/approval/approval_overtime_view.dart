import 'package:flutter/material.dart';

class ApprovalOvertime extends StatefulWidget {
  @override
  _ApprovalOvertimeState createState() => _ApprovalOvertimeState();
}

class _ApprovalOvertimeState extends State<ApprovalOvertime> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text("Date"),
                subtitle: Text(DateTime.now().toIso8601String()),
              ),
              ListTile(
                title: Text("Employee"),
                subtitle: Text("Adam"),
              ),
              ListTile(
                title: Text("Overtime Duration"),
                subtitle: Text("2"),
              ),
              ListTile(
                title: Text("Start Time"),
                subtitle: Text("08.45"),
              ),
              ListTile(
                title: Text("End Time"),
                subtitle: Text("10.45"),
              ),
              ListTile(
                title: Text("Overtime Status"),
                subtitle: Text("2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
