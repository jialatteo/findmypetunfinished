import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:provider/provider.dart';

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black38, width: 2.0)),
      child: SignInButtonBuilder(
        backgroundColor: Colors.white,
        text: 'Continue with Google',
        textColor: Colors.black,
        onPressed: widget.onPressed,
        splashColor: Colors.black45,
        image: Image.asset(
          'images/google.png',
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
