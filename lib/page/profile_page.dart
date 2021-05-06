import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.indigo[800],
              child: ListTile(
                title: Text(
                  "Adam Idris",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Karyawan",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                ListTile(title: Text("Divisi"), subtitle: Text("Marketing")),
                Divider(),
                ListTile(
                    title: Text("Lokasi Kantor"), subtitle: Text("Jakarta")),
                Divider(),
                ListTile(
                    title: Text("No telepon"), subtitle: Text("080000000000")),
                Divider(),
                ListTile(
                    title: Text("Email"), subtitle: Text("Adam@email.com")),
                Divider(),
                ListTile(title: Text("Reset Password")),
                Divider(),
                ListTile(title: Text("Sign Out")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
