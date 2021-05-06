class LoginAuth {
  String message;
  TokenAuth data;

  LoginAuth({
    this.message,
    this.data,
  });

  LoginAuth.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = TokenAuth.fromJson(json['data']);
  }
}

class TokenAuth {
  String token;

  TokenAuth({this.token});

  TokenAuth.fromJson(Map<String, dynamic> data) {
    token = data['token'];
  }
}

class UserProfile {
  String firstName;
  String lastName;
  String email;

  UserProfile({this.firstName, this.lastName, this.email});
  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      firstName = json['data']['first_name'];
      lastName = json['data']['last_name'];
      email = json['data']['email'];
    } else {
      firstName = "";
      lastName = "";
      email = "";
    }
  }
}

class Logout {
  String message;

  Logout({this.message});
  Logout.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
