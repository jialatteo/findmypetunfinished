import 'package:flutter/material.dart';

// TODO: reset password page
class ResetPasswordPage extends StatefulWidget {
  static String route = "ResetPasswordPag";

  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        'Reset password page',
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}
