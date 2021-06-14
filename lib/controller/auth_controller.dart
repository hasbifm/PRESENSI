import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/api/Request.dart';
import 'package:presensi/model/profile_model.dart';
import 'package:presensi/page/home_page.dart';
import 'package:presensi/page/login/login_page.dart';
import 'package:presensi/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthRepository authRepository;
  RxList<ProfileModel> profileList = <ProfileModel>[].obs;
  Rx<ProfileModel> profile = ProfileModel().obs;

  var profileurl = Uri.parse('http://192.168.20.7:8000/api/auth/profile');
  var loginUrl = Uri.parse("http://192.168.20.7:8000/api/auth/login");

  AuthController() {
    authRepository = AuthRepository();
  }

  Future<void> login(_email, _password) async {
    print(_email);
    print(_password);

    Request request = Request(
        url: 'auth/login', body: {'email': _email, 'password': _password});
    request.post().then((value) async {
      if (value.statusCode == 200) {
        var jsonResponse = jsonDecode(value.body);
        final SharedPreferences pref = await SharedPreferences.getInstance();
        print(jsonResponse);
        pref.setString('token', jsonResponse['token']);
        Get.to(() => HomePage());
      } else {
        Get.snackbar("Login", "Login Failed");
        print("Error");
      }
    }).catchError((onError) {
      printError();
    });
  }

  Future getProfile() async {
    Request request = Request(url: 'auth/profile');
    request.get().then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = jsonDecode(value.body);
        profile.value = ProfileModel.fromJson(jsonResponse);
      } else {
        print("Error");
      }
    }).catchError((onError) {
      printError();
    });
  }

  Future<void> logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
    Get.to(() => LoginPage()).whenComplete(() => profileList.clear());
    profileList.clear();
  }
}
