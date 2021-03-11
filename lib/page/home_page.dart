import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0x2C2C54),
        unselectedItemColor: Colors.white10,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on), label: "Attendance"),
          BottomNavigationBarItem(icon: Icon(Icons.fact_check), label: "Task"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Cuti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add), label: "Overtime"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Approval"),
        ],
      ),
    );
  }
}
