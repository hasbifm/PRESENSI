import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//jika melalui real device
const urlBase = 'http://192.168.20.7:8000/api/';

// ///jika melalui emulator
// const urlBase = 'http://10.0.2.2/api/';

// ///jika melalui genymotion
// const urlBase = 'http://10.0.3.2/api/';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  Future<http.Response> post() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    return http.post(Uri.parse(urlBase + url), body: body, headers: {
      'Authorization': 'Bearer $token'
    }).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    print(urlBase + url);
    return http.get(Uri.parse(urlBase + url), headers: {
      'Authorization': 'Bearer $token'
    }).timeout(Duration(minutes: 2));
  }

  Future<http.Response> put() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    print(urlBase + url);
    return http.put(Uri.parse(urlBase + url), body: body, headers: {
      'Authorization': 'Bearer $token'
    }).timeout(Duration(minutes: 2));
  }
}
