import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presensi/model/login_auth.dart';
import 'package:presensi/page/attendance/attendance_page.dart';
import 'package:presensi/page/home_page.dart';
import 'package:presensi/page/login/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // var login = Uri.parse('http://10.0.2.2:8000/api/auth/login');
  var login = Uri.parse('http://192.168.20.3:8000/api/auth/login');
  var reset = Uri.parse('https://192.168.20.3:8000/api/auth/password');
  bool forgot = false;
  String email;
  String password;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!forgot)
                    LoginForm(
                      email: email,
                      password: password,
                      onChangedUserEmail: (email) =>
                          setState(() => this.email = email),
                      onChangedPassword: (password) =>
                          setState(() => this.password = password),
                      onSaved: () => _login(),
                      onCancel: () => Get.back(),
                      onForgot: () => setState(() => _forgot()),
                    ),
                  if (forgot)
                    ForgotPasswordForm(
                      email: email,
                      onChangedUserEmail: (email) =>
                          setState(() => this.email = email),
                      onSaved: () => _requestReset(),
                      onSignIn: () => setState(() => _signIn()),
                    ),
                ],
              )),
        ),
      ),
    );
  }

  Future _login() async {
    final isValid = _formkey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final response =
          await http.post(login, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print(email);
        print(password);
        Get.snackbar("Login", "Login Berhasil");
        print(jsonDecode(response.body));
        Get.to(HomePage());
        LoginAuth.fromJson(jsonDecode(response.body));
        // jsonDecode(response.body);
      } else {
        Get.snackbar("Login", "Login Gagal");
      }
    }
  }

  Future _requestReset() async {
    final isValid = _formkey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final response = await http.post(reset, body: {'email': email});
      if (response.statusCode == 200) {
        print(email);
        print(password);
        Get.snackbar("Login", "Request Berhasil");
        setState(() => _signIn());
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        Get.snackbar("Login", "Request Gagal");
      }
    }
  }

  _forgot() {
    setState(() {
      forgot = true;
      email = "";
      password = "";
    });
  }

  _signIn() {
    setState(() {
      forgot = false;
      email = "";
      password = "";
    });
  }
}
