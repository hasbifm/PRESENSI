import 'package:flutter/material.dart';

class Cuti extends StatefulWidget {
  @override
  _CutiState createState() => _CutiState();
}

class _CutiState extends State<Cuti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Ajukan Izin"),
      ),
    );
  }
}
