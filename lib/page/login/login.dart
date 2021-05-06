import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final String email;
  final String password;
  final ValueChanged<String> onChangedUserEmail;
  final ValueChanged<String> onChangedPassword;
  final VoidCallback onSaved;
  final VoidCallback onCancel;
  final VoidCallback onForgot;

  const LoginForm({
    Key key,
    this.email = "",
    this.password = "",
    this.onChangedUserEmail,
    this.onChangedPassword,
    this.onSaved,
    this.onCancel,
    this.onForgot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgetBuildTitle(),
          SizedBox(
            height: 10,
          ),
          widgetBuildEmail(),
          SizedBox(
            height: 10,
          ),
          widgetBuildPassword(),
          widgetBuildButton()
        ],
      ),
    );
  }

  widgetBuildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }

  widgetBuildEmail() {
    return TextFormField(
      initialValue: email,
      validator: (email) {
        if (email.isEmpty) {
          return "Email belum diisi";
        } else {
          return null;
        }
      },
      onChanged: onChangedUserEmail,
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Email",
      ),
    );
  }

  widgetBuildPassword() {
    return TextFormField(
      initialValue: password,
      obscureText: true,
      validator: (password) {
        if (password.isEmpty) {
          return "Password belum diisi";
        } else {
          return null;
        }
      },
      onChanged: onChangedPassword,
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Password",
      ),
    );
  }

  widgetBuildButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onForgot,
              child: Text("Forgot Password?"),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSaved,
            child: Text("Login"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
        ),
      ],
    );
  }
}
