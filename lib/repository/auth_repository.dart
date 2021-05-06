import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:presensi/model/login_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future loginUser(String _email, String _password) async {
    String baseUrl = "http://192.20.0.3:8000/api/auth/login";

    try {
      var respose = await http.post(Uri.parse(baseUrl), body: {
        'email': _email,
        'password': _password,
      });

      var jsonResponse = jsonDecode(respose.body);
      return LoginAuth.fromJson(jsonResponse);
    } catch (e) {
      return e;
    }
  }

  Future logoutUser(String token) async {
    String baseUrl = "http://127.0.0.1:8000/api/auth/logout";

    try {
      var response = await http.post(Uri.parse(baseUrl), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });

      var jsonResponse = jsonDecode(response.body);
      return Logout.fromJson(jsonResponse);
    } catch (e) {
      return e;
    }
  }

  Future getData(String token) async {
    String baseUrl = 'http://127.0.0.1:8000/api/auth/profile';

    try {
      var response = await http.post(Uri.parse(baseUrl), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });

      var jsonResponse = jsonDecode(response.body);
      return UserProfile.fromJson(jsonResponse);
    } catch (e) {
      print(e);
    }
  }

  Future hasToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    final String token = local.getString('token') ?? null;
    if (token != null) return token;
    return null;
  }

  Future setLocalToken(String token) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    local.setString("token", token);
  }

  Future unsetLocalToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    local.setString("token", null);
  }
}
