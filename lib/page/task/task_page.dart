import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Text("Senin, 01-01-2020"),
            ),
            Text("Membuat CRUD"),
          ],
        ),
      ),
    );
  }
}
