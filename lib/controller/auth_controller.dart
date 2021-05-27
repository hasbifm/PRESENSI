import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi/model/profile_model.dart';
import 'package:presensi/page/home_page.dart';
import 'package:presensi/page/login/login_page.dart';
import 'package:presensi/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthRepository authRepository;
  RxList<ProfileModel> profileList = <ProfileModel>[].obs;

  var profileurl = Uri.parse('http://192.168.20.4:8000/api/auth/profile');
  var loginUrl = Uri.parse("http://192.168.20.4:8000/api/auth/login");

  AuthController() {
    authRepository = AuthRepository();
  }

  Future<void> login(_email, _password) async {
    print(_email);
    print(_password);

    final response = await http
        .post(loginUrl, body: {'email': _email, 'password': _password});
    if (response.statusCode == 200) {
      var loginData = jsonDecode(response.body);
      print(loginData);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', loginData['token']);
      Get.to(() => HomePage());
    } else {
      Get.snackbar("Login", "Login Failed");
    }
  }

  Future getProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    final response =
        await http.get(profileurl, headers: {'Authorization': 'Bearer $token'});
    var profileData = jsonDecode(response.body);
    print(profileData);
    if (profileList.isEmpty) {
      profileList.add(ProfileModel.fromJson(profileData));
    }
  }

  Future<void> logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
    Get.to(() => LoginPage()).whenComplete(() => profileList.clear());
    profileList.clear();
  }
}
