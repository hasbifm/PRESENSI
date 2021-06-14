import 'package:flutter/material.dart';

class ApprovalCuti extends StatefulWidget {
  @override
  _ApprovalCutiState createState() => _ApprovalCutiState();
}

class _ApprovalCutiState extends State<ApprovalCuti> {
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
                title: Text("Reason"),
                subtitle: Text("sakit"),
              ),
              ListTile(
                title: Text("Absent Status"),
                subtitle: Text("2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
