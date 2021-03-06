import 'package:flutter/material.dart';

class ApprovalAttendance extends StatefulWidget {
  @override
  _ApprovalAttendanceState createState() => _ApprovalAttendanceState();
}

class _ApprovalAttendanceState extends State<ApprovalAttendance> {
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
                title: Text("Clock-In Time"),
                subtitle: Text("08.50"),
              ),
              ListTile(
                title: Text("Clock-OUt TIme"),
                subtitle: Text("NOT_CLOCKED_OUT"),
              ),
              ListTile(
                title: Text("Attendance Status"),
                subtitle: Text("Approved"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
