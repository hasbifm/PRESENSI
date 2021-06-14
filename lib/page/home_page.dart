import 'package:flutter/material.dart';
import 'package:presensi/controller/auth_controller.dart';
import 'package:presensi/page/attendance/attendance_page.dart';

import 'package:get/get.dart';
import 'package:presensi/page/cuti/absent_page.dart';
import 'package:presensi/page/profile/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'approval/approval_page.dart';
import 'overtime/overtime_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authcontroller = Get.put(AuthController());
  String token;
  @override
  void initState() {
    super.initState();
    authcontroller.getProfile();
  }

  Future<void> getProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
  }

  int selectedIndex = 0;
  int tabbarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [Attendance(), Absent(), Overtime(), Approval()];
    final title = ["Attendance", "Cuti", "Overtime", "Approval"];
    final tabbarSize = [2, 0, 0, 3];
    final tabbar = [attendanceTabbar(), null, null, approvalTabbar()];
    return DefaultTabController(
      length: tabbarSize[selectedIndex],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title[selectedIndex]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => Get.to(() => Profile())),
            )
          ],
          bottom: tabbar[selectedIndex],
          backgroundColor: Colors.indigo[700],
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo[800],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          selectedFontSize: 10,
          unselectedFontSize: 9,
          // iconSize: 32,
          currentIndex: selectedIndex,
          onTap: (index) => setState(
            () {
              selectedIndex = index;
            },
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on),
              label: "Attendance",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "Cuti",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add),
              label: "Overtime",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Approval",
            ),
          ],
        ),
      ),
    );
  }

  Widget attendanceTabbar() {
    return TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 5,
      unselectedLabelColor: Colors.white24,
      tabs: [
        Tab(text: "Absensi"),
        Tab(text: "History"),
      ],
    );
  }

  Widget approvalTabbar() {
    return TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 5,
      unselectedLabelColor: Colors.white24,
      tabs: [
        Tab(text: "Absensi"),
        Tab(text: "Lembur"),
        Tab(text: "Cuti"),
      ],
    );
  }
}
