import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  final String email;
  final ValueChanged<String> onChangedUserEmail;
  final VoidCallback onSaved;
  final VoidCallback onSignIn;

  const ForgotPasswordForm(
      {Key key,
      this.email,
      this.onChangedUserEmail,
      this.onSaved,
      this.onSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgetBuildTitle(),
          SizedBox(height: 10),
          widgetBuildEmail(),
          widgetBuildButton(),
        ],
      ),
    );
  }

  widgetBuildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Forgot Password",
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

  widgetBuildButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onSignIn,
              child: Text("Sign In?"),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSaved,
            child: Text("Request Reset Password"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
        ),
      ],
    );
  }
}
