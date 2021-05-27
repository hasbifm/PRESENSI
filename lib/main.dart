import 'package:flutter/material.dart';
import 'package:presensi/page/home_page.dart';
import 'package:get/get.dart';
import 'package:presensi/page/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isLogin;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _loginCheck();
  }

  Future _loginCheck() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final _token = pref.getString('token');
    if (_token != null) {
      setState(() {
        isLogin = true;
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
  }

  Widget auth(isLogin) {
    if (isLogin) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == null) {
      return GetMaterialApp(
        home: Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
    } else {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: auth(isLogin),
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
