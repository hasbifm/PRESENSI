import 'package:flutter/material.dart';
import 'package:presensi/controller/auth_controller.dart';
import 'package:presensi/model/profile_model.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    authcontroller.getProfile();
  }

  final authcontroller = Get.put(AuthController());
  ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    authcontroller.getProfile();
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.indigo[700],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.indigo[800],
                child: ListTile(
                    title: Obx(() => authcontroller.profileList.isEmpty
                        ? Text("Empty")
                        : Text(
                            authcontroller.profileList[0].first_name
                                    .toString() +
                                authcontroller.profileList[0].last_name
                                    .toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                    trailing:
                        IconButton(icon: Icon(Icons.edit), onPressed: null)),
              ),
              Column(
                children: [
                  ListTile(
                      title: Text("Email"),
                      subtitle: Obx(
                        () => authcontroller.profileList.isEmpty
                            ? Text("Empty")
                            : Text(authController.profileList[0].email),
                      ),
                      trailing:
                          IconButton(icon: Icon(Icons.edit), onPressed: null)),
                  Divider(),
                  ListTile(
                      title: Text("Change Password"),
                      trailing:
                          IconButton(icon: Icon(Icons.edit), onPressed: null)),
                  Divider(),
                  ListTile(
                    title: Text("Role"),
                    subtitle: Obx(() => authcontroller.profileList.isEmpty
                        ? Text("Empty")
                        : Text('${authcontroller.profileList[0].id_role}')),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Division And Office"),
                    subtitle: Obx(() => authcontroller.profileList.isEmpty
                        ? Text("Empty")
                        : Text(
                            '${authcontroller.profileList[0].division_office_id}')),
                  ),
                  Divider(),
                  ListTile(
                      title: TextButton(
                    onPressed: () => authcontroller.logOut(),
                    child: Text("Log Out"),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
